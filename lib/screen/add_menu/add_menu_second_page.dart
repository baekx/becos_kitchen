import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/screen/add_menu/label.dart';
import 'package:becos_kitchen/screen/add_menu/menu_date_picker.dart';
import 'package:becos_kitchen/screen/add_menu/menu_memo.dart';
import 'package:becos_kitchen/screen/add_menu/menu_rate.dart';
import 'package:becos_kitchen/screen/add_menu/menu_url.dart';
import 'package:becos_kitchen/screen/common/button_expanded.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:becos_kitchen/view_model/add_menu_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddMenuSecondPage extends ConsumerWidget {
  const AddMenuSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(addMenuViewModelProvider.notifier);
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
                })
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              // 星
              const ColumnPadding(height: 16.0),
              const Label(text: "お気に入り"),
              const MenuRate(),
              // 料理した日
              const ColumnPadding(height: 16.0),
              const Label(text: "料理した日"),
              MenuDatePicker(),
              // URL
              ColumnPadding(height: 16.0),
              Label(text: "URL"),
              MenuUrl(),
              // メモ
              ColumnPadding(height: 16.0),
              Label(text: "メモ"),
              MenuMemo(),
              // 戻るボタン
              ColumnPadding(height: 16.0),
              ButtonExpanded(
                text: "前の画面へ",
                onPressed: () {
                  Navigator.of(context).pop();
                },
                backgroundColor: Color(cancel),
              ),
              //追加ボタン
              ColumnPadding(height: 16.0),
              ButtonExpanded(
                text: "追加",
                onPressed: () {
                  vm.postMenuData();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                backgroundColor: Color(green),
              ),
              ColumnPadding(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
