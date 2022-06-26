import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/menu_state.dart';

class MenuDao {
  static final CollectionReference _menus =
      FirebaseFirestore.instance.collection('menu');

  static Future<dynamic> setMenu(MenuState newMenu) async {
    try {
      await _menus
          .doc(newMenu.title)
          .set({'title': newMenu.title, 'score': newMenu.score});
      print('メニュー追加完了');
      return true;
    } on FirebaseException catch (e) {
      print('メニュー追加失敗: $e');
      return false;
    }
  }

  // void saveMenu(MenuState menu) {
  //   _menus.add(menu.toJson());
  // }
}
