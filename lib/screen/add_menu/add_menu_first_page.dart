import 'dart:io';

import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/screen/add_menu/add_menu_second_page.dart';
import 'package:becos_kitchen/screen/add_menu/label.dart';
import 'package:becos_kitchen/screen/add_menu/menu_image.dart';
import 'package:becos_kitchen/screen/add_menu/menu_tag_list.dart';
import 'package:becos_kitchen/screen/add_menu/menu_title.dart';
import 'package:becos_kitchen/screen/common/button_expanded.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
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
    final _vm = ref.watch(addMenuViewModelProvider);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "料理を追加",
            style: TextStyle(color: Color(green)),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/cancel.svg'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              // 写真
              const ColumnPadding(height: 16.0),
              const Label(text: "写真"),
              const MenuImage(),
              // タイトル
              const ColumnPadding(height: 16.0),
              const Label(text: "タイトル"),
              const MenuTitle(),
              // タグ
              const ColumnPadding(height: 8.0),
              const Label(text: "タグ"),
              const MenuTagList(),
              // 次へボタン
              const ColumnPadding(height: 8.0),
              ButtonExpanded(
                text: "次へ",
                onPressed: () {
                  // ref.watch(addMenuPageProvider.notifier).addMenu();
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => AddMenuSecondPage(),
                  ));
                },
                backgroundColor: const Color(green),
              ),
              const ColumnPadding(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
