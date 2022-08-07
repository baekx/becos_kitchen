import 'package:becos_kitchen/model/add_menu_state.dart';
import 'package:becos_kitchen/model/menu.dart';

abstract class MenuRepository {
  Future<List<Menu>> fetchMenuList();
  Future<void> addMenuData(AddMenuState menu);
}
