import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/screen/menu_list/menu_card.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key, required this.menuList}) : super(key: key);
  final List<MenuModel> menuList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.count(
        childAspectRatio: 0.60,
        crossAxisCount: 2,
        children: menuList.map((menu) {
          return MenuCard(menu: menu);
        }).toList(),
      ),
    );
  }
}
