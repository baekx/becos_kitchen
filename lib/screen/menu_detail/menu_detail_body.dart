import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/component/menu_tag.dart';
import 'package:becos_kitchen/ext/date_ext.dart';
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
                const ColumnPadding(height: 16),
                // タグ
                Container(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 16.0,
                    children:
                        menu.tag.map((tag) => MenuTag(label: tag)).toList(),
                  ),
                ),
                const ColumnPadding(height: 24),
                // お気に入り
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuDetailRating(),
                    const RowPadding(width: 16.0),
                    MenuDetailRating(),
                  ],
                ),
                const ColumnPadding(height: 16),
                // 料理した日
                const Text(
                  '料理した日',
                  style: TextStyle(fontSize: 12, color: Color(textColor)),
                ),
                const ColumnPadding(height: 16),
                Text(
                  menu.createdAt.dateOfMonth(),
                  style: const TextStyle(fontSize: 16),
                ),
                const ColumnPadding(height: 24),
                // コメント
                const Text(
                  'コメント',
                  style: TextStyle(fontSize: 12, color: Color(textColor)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
