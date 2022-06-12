import 'dart:io';

import 'package:becos_kitchen/screen/add_menu/label.dart';
import 'package:becos_kitchen/screen/add_menu/menu_image.dart';
import 'package:becos_kitchen/screen/add_menu/menu_rate.dart';
import 'package:becos_kitchen/screen/add_menu/menu_title.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:flutter/material.dart';

class AddMenuScreen extends StatelessWidget {
  const AddMenuScreen({Key? key, this.image}) : super(key: key);
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("料理を追加"),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // 写真
            ColumnPadding(height: 24.0),
            MenuImage(imagePath: image),
            // タイトル
            ColumnPadding(height: 24.0),
            MenuTitle(),
            // 星
            ColumnPadding(height: 24.0),
            Label(text: "お気に入り度"),
            MenuRate()
          ],
        ),
      ),
    );
  }
}
