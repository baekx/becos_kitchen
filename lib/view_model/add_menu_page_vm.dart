import 'dart:io';

import 'package:becos_kitchen/model/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMenuViewModel extends StateNotifier<Menu> {
  AddMenuViewModel() : super(const Menu(name: '', rate: 1, image: "", tag: []));

  void setTitle(String newTitle) {
    state = state.copyWith(name: newTitle);
  }

  void setRate(int newScore) {
    state = state.copyWith(rate: newScore);
  }

  void addMenu() {
    // MenuDao.setMenu(state);
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
