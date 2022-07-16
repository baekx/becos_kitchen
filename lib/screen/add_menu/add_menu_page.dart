import 'dart:io';

import 'package:becos_kitchen/provider.dart';
import 'package:becos_kitchen/screen/add_menu/label.dart';
import 'package:becos_kitchen/screen/add_menu/menu_rate.dart';
import 'package:becos_kitchen/screen/add_menu/menu_tag_list.dart';
import 'package:becos_kitchen/screen/add_menu/menu_title.dart';
import 'package:becos_kitchen/screen/common/button_expanded.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMenuPage extends ConsumerWidget {
  const AddMenuPage({Key? key, this.image}) : super(key: key);
  final File? image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("料理を追加"),
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
            const ColumnPadding(height: 32.0),
            // MenuImage(imagePath: widget.image),
            // タイトル
            const ColumnPadding(height: 8.0),
            const MenuTitle(),
            // 星
            const ColumnPadding(height: 8.0),
            const Label(text: "お気に入り度"),
            const MenuRate(),
            // タグ
            const ColumnPadding(height: 8.0),
            const Label(text: "タグ"),
            const MenuTagList(),
            // 次へボタン
            const ColumnPadding(height: 8.0),
            // Container(
            //   height: 200,
            //   child: StreamBuilder<QuerySnapshot>(
            //     stream:
            //         FirebaseFirestore.instance.collection('menu').snapshots(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasError) {
            //         return Text("エラー");
            //       }
            //       final list = snapshot.requireData.docs
            //           .map<String>((DocumentSnapshot document) {
            //         final documentData =
            //             document.data()! as Map<String, dynamic>;
            //         return documentData['name']! as String;
            //       }).toList();
            //
            //       return ListView.builder(
            //           itemCount: list.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return Text(list[index]);
            //           });
            //     },
            //   ),
            // ),
            ButtonExpanded(
              text: "次へ",
              onPressed: () {
                ref.watch(addMenuPageProvider.notifier).addMenu();
              },
            ),
            const ColumnPadding(height: 32.0),
          ],
        ),
      ),
    );
  }
}
