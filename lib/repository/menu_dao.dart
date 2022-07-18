import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/menu.dart';

class MenuDao {
  static final CollectionReference _menus =
      FirebaseFirestore.instance.collection('menu');

  static void getMenuList() {
    // try {
    //
    // }
  }

  static void setMenu(Menu newMenu) {
    // try {
    //   final document = <String, dynamic>{
    //     'title': newMenu.title,
    //     'score': newMenu.score
    //   };
    //   _menus.doc().set(document);
    //   print('メニュー追加完了');
    //   // return true;
    // } on FirebaseException catch (e) {
    //   print('メニュー追加失敗: $e');
    //   // return false;
    // }
  }
}
