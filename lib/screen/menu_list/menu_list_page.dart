import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/screen/add_menu/add_menu_first_page.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list_body.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list_header.dart';
import 'package:becos_kitchen/view_model/menu_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuListPage extends ConsumerWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(menuListViewModelProvider.notifier);
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: MenuListHeader()),
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
      body: RefreshIndicator(
        onRefresh: () async {
          vm.getMenuList();
        },
        child: const MenuListBody(),
      ),
    );
  }
}
