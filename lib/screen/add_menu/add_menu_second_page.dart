import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/screen/add_menu/label.dart';
import 'package:becos_kitchen/screen/add_menu/menu_rate.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddMenuSecondPage extends ConsumerWidget {
  const AddMenuSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
            const ColumnPadding(height: 8.0),
            const Label(text: "お気に入り"),
            const MenuRate(),
            // 料理した日
          ],
        ),
      ),
    );
  }
}
