import 'dart:io';

import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/screen/add_menu/add_menu_second_page.dart';
import 'package:becos_kitchen/screen/add_menu/label.dart';
import 'package:becos_kitchen/screen/add_menu/menu_image.dart';
import 'package:becos_kitchen/screen/add_menu/menu_tag_list.dart';
import 'package:becos_kitchen/screen/add_menu/menu_title.dart';
import 'package:becos_kitchen/screen/common/button_expanded.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:becos_kitchen/screen/common/custom_alert_dialog.dart';
import 'package:becos_kitchen/view_model/add_menu_page_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddMenuFirstPage extends ConsumerWidget {
  const AddMenuFirstPage({Key? key, this.image}) : super(key: key);
  final File? image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _vm = ref.watch(addMenuViewModelProvider.notifier);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "料理を追加",
            style: TextStyle(color: Color(textBlack)),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/cancel.svg'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return CustomAlertDialog(
                    proceedButtonText: '終了',
                    description: '編集内容は保存されません。\n終了してよろしいですか？',
                    onPressedEnd: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  );
                },
              );
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // 写真
                const ColumnPadding(height: 16.0),
                const Label(text: "写真"),
                const ColumnPadding(height: 8.0),
                const MenuImage(),
                // タイトル
                const ColumnPadding(height: 12.0),
                const Label(text: "タイトル"),
                const ColumnPadding(height: 8.0),
                const MenuTitle(),
                // タグ
                const ColumnPadding(height: 8.0),
                const Label(text: "タグ"),
                const ColumnPadding(height: 8.0),
                const MenuTagList(),
                // 次へボタン
                const ColumnPadding(height: 24.0),
                ButtonExpanded(
                  text: "次へ",
                  onPressed: () {
                    _vm.setUid();
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (_) => const AddMenuSecondPage(),
                    ));
                  },
                  backgroundColor: const Color(green),
                ),
                const ColumnPadding(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
