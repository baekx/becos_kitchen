import 'package:becos_kitchen/model/add_menu_state.dart';
import 'package:becos_kitchen/model/menu_model.dart';

abstract class MenuRepository {
  Future<List<MenuModel>> fetchMenuList();
  Future<void> addMenuData(AddMenuState menu);
}
