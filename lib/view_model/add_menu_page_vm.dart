import 'dart:io';

import 'package:becos_kitchen/model/add_menu_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../screen/add_menu/menu_tag_list.dart';

final addMenuViewModelProvider =
    StateNotifierProvider<AddMenuViewModel, AddMenuState>(
        (ref) => AddMenuViewModel());

class AddMenuViewModel extends StateNotifier<AddMenuState> {
  AddMenuViewModel()
      : super(AddMenuState(
            name: '',
            tag: [],
            rate: 3,
            createdAt: DateTime.now(),
            url: '',
            memo: ''));

  void setTitle(String newTitle) {
    state = state.copyWith(name: newTitle);
  }

  void setTag(MenuTag menuTag) {
    var list = List.of(state.tag);
    list.add(menuTag.name);
    state = state.copyWith(tag: list);
  }

  void removeTag(MenuTag menuTag) {
    var list = List.of(state.tag);
    list.remove(menuTag.name);
    state = state.copyWith(tag: list);
  }

  bool hasTag(MenuTag menuTag) {
    return state.tag.contains(menuTag.name);
  }

  void setRate(int newScore) {
    state = state.copyWith(rate: newScore);
  }

  Future<void> setImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    state = state.copyWith(imageFile: File(pickedFile.path));
  }

  void setCreatedAt(DateTime newDate) {
    state = state.copyWith(createdAt: newDate);
  }

  void uploadImage(File file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    try {
      await storage.ref("menu/${file.path}").putFile(file);
    } catch (e) {
      print(e);
    }
  }

  void addMenu() {
    final document = <String, dynamic>{
      'title': state.name,
      'score': state.rate
    };
    FirebaseFirestore.instance.collection('menu').doc().set(document);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    return FirebaseFirestore.instance.collection('menu').snapshots();
  }
}
