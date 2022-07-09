import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/menu_state.dart';

class MenuDao {
  static final CollectionReference _menus =
      FirebaseFirestore.instance.collection('menu');

  static void setMenu(MenuState newMenu) {
    try {
      final document = <String, dynamic>{
        'title': newMenu.title,
        'score': newMenu.score
      };
      _menus.doc().set(document);
      print('メニュー追加完了');
      // return true;
    } on FirebaseException catch (e) {
      print('メニュー追加失敗: $e');
      // return false;
    }
  }

  // void setMenu(MenuState menu) {
  //   _menus.add(menu.toJson());
  // }
}
