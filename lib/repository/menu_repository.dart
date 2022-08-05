import 'package:becos_kitchen/model/menu.dart';

abstract class MenuRepository {
  Future<List<Menu>> fetchMenuList();
  Future<String> addMenu(Menu menu);
}
