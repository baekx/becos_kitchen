import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/ext/date_ext.dart';
import 'package:becos_kitchen/screen/common/circle_user_avatar.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:becos_kitchen/view_model/menu_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDetailCommentCell extends ConsumerWidget {
  const MenuDetailCommentCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(menuDetailViewModelProvider.notifier);
    final state = ref.watch(menuDetailViewModelProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleUserAvatar(
            size: 40,
            icon: vm.getUser().imagePath,
          ),
          const RowPadding(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.createdAt.dateOfMonthWithWeek(),
                  style: const TextStyle(fontSize: 10, color: Color(textColor)),
                ),
                Text(
                  state.memo,
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
