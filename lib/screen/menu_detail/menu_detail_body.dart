import 'package:becos_kitchen/component/menu_tag.dart';
import 'package:becos_kitchen/screen/add_menu/label.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
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
          // 写真
          Image.network(
            menu.image,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 名前
                Text(
                  menu.name,
                  style: const TextStyle(fontSize: 20),
                ),
                ColumnPadding(height: 16),
                // タグ
                Container(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 16.0,
                    children:
                        menu.tag.map((tag) => MenuTag(label: tag)).toList(),
                  ),
                ),
                ColumnPadding(height: 24),
                // お気に入り
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuDetailRating(),
                    const RowPadding(width: 16.0),
                    MenuDetailRating(),
                  ],
                ),
                ColumnPadding(height: 16),
                // 料理した日
                const Label(text: "料理した日"),
                Text(
                  menu.createdAt.toString(),
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
