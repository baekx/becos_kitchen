import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/view_model/menu_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({Key? key, required this.menu}) : super(key: key);
  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        menuDetailViewModelProvider
            .overrideWithProvider(menuDetailViewModelFamily(menu))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('詳細'),
        ),
        body: _MenuDetailBody(),
      ),
    );
  }
}

class _MenuDetailBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menu = ref.watch(menuDetailViewModelProvider);
    return Column(
      children: [
        Text(menu.name),
        Image.network(menu.image, width: 120, height: 120),
        Text(menu.createdAt.toString()),
        Text(menu.tag.toString())
      ],
    );
  }
}
