import 'package:becos_kitchen/model/menu_model.dart';
import 'package:flutter/material.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({Key? key, required this.menu}) : super(key: key);
  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('詳細'),
      ),
      body: Text(menu.name + menu.image + menu.createdAt.toString()),
    );
  }
}

class _MenuDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(menu)
      ],
    );
  }
}
