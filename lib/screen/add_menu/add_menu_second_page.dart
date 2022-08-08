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
            style: TextStyle(color: Color(textBlack)),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/cancel.svg'),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // 星
                const ColumnPadding(height: 16.0),
                const Label(text: "お気に入り度"),
                const ColumnPadding(height: 8.0),
                const MenuRate(),
                // 料理した日
                const ColumnPadding(height: 16.0),
                const Label(text: "料理した日"),
                const ColumnPadding(height: 8.0),
                const MenuDatePicker(),
                // URL
                const ColumnPadding(height: 16.0),
                const Label(text: "URL"),
                const ColumnPadding(height: 8.0),
                const MenuUrl(),
                // コメント
                const ColumnPadding(height: 16.0),
                const Label(text: "コメント"),
                const ColumnPadding(height: 8.0),
                const MenuMemo(),
                const ColumnPadding(height: 24.0),
                // 戻るボタン
                ButtonExpanded(
                  text: "前の画面へ",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  backgroundColor: const Color(cancel),
                ),
                //追加ボタン
                const ColumnPadding(height: 16.0),
                ButtonExpanded(
                  text: "追加",
                  onPressed: () async {
                    if (vm.isValidMenuData()) {
                      await vm.addMenuData();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  },
                  backgroundColor: vm.isValidMenuData()
                      ? const Color(green)
                      : const Color(cancel),
                ),
                const ColumnPadding(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
