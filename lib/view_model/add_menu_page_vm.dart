import 'dart:io';

import 'package:becos_kitchen/model/add_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final addMenuViewModelProvider =
    StateNotifierProvider.autoDispose<AddMenuViewModel, AddMenu>(
        (ref) => AddMenuViewModel());

class AddMenuViewModel extends StateNotifier<AddMenu> {
  AddMenuViewModel() : super(const AddMenu());

  void setTitle(String newTitle) {
    state = state.copyWith(name: newTitle);
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

  void addMenu() {
    final document = <String, dynamic>{
      'title': state.name,
      'score': state.rate
    };
    FirebaseFirestore.instance.collection('menu').doc().set(document);
  }

  void uploadImage(File file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    try {
      await storage.ref("menu/${file.path}").putFile(file);
    } catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    return FirebaseFirestore.instance.collection('menu').snapshots();
  }
}
