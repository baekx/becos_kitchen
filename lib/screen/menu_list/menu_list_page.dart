import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/provider.dart';
import 'package:becos_kitchen/screen/add_menu/add_menu_first_page.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80), child: MenuListHeader()),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 40,
            color: Color(green),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddMenuFirstPage(),
                fullscreenDialog: true,
              ),
            );
          },
        ),
        body: _MenuList());
  }
}

class _MenuList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuList = ref.watch(menuListProvider);

    return menuList.when(
        data: (data) => MenuList(menuList: data),
        error: (_, stackTrace) => const Center(
              child: Text('データ取得に失敗しました'),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
