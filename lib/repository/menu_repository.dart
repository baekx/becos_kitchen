import 'package:becos_kitchen/model/add_menu_state.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MenuRepository {
  Stream<QuerySnapshot<MenuModel>> menuListSnapshot();
  Future<void> addMenuData(AddMenuState menu);
  Future<void> updateMenuData(MenuModel menu);
}
