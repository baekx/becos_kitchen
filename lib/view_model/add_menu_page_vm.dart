import 'package:becos_kitchen/model/menu_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMenuPageStateNotifier extends StateNotifier<MenuState> {
  AddMenuPageStateNotifier() : super(const MenuState(title: '', score: 1));

  void setTitle(String newTitle) {
    state = state.copyWith(title: newTitle);
  }

  void setRate(int newScore) {
    state = state.copyWith(score: newScore);
  }

  void addMenu() {
    // MenuDao.setMenu(state);
    final document = <String, dynamic>{
      'title': state.title,
      'score': state.score
    };
    FirebaseFirestore.instance.collection('menu').doc().set(document);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    return FirebaseFirestore.instance.collection('menu').snapshots();
  }
}
