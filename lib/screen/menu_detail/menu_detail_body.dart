import 'package:becos_kitchen/component/menu_tag.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:becos_kitchen/screen/menu_detail/menu_detail_rating.dart';
import 'package:becos_kitchen/view_model/menu_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDetailBody extends ConsumerWidget {
  const MenuDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menu = ref.watch(menuDetailViewModelProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            menu.image,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              menu.name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 16.0,
                children: menu.tag.map((tag) => MenuTag(label: tag)).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuDetailRating(),
                const RowPadding(width: 16.0),
                MenuDetailRating(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
