import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/screen/menu_list/menu_card.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key, required this.menuList}) : super(key: key);
  final Stream<List<MenuModel>> menuList;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MenuModel>>(
      stream: menuList,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Text('エラーが発生しました');
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.count(
            childAspectRatio: 0.60,
            crossAxisCount: 2,
            children: snapshot.requireData.map((menu) {
              return MenuCard(menu: menu);
            }).toList(),
          ),
        );
      },
    );
  }
}
