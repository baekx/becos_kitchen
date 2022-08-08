import 'package:becos_kitchen/screen/menu_list/menu_list.dart';
import 'package:becos_kitchen/view_model/menu_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuListBody extends ConsumerWidget {
  const MenuListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuList = ref.watch(menuListViewModelProvider);

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
