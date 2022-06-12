import 'dart:io';

import 'package:becos_kitchen/screen/add_menu/menu_image.dart';
import 'package:becos_kitchen/screen/add_menu/menu_title.dart';
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          MenuImage(imagePath: image),
          MenuTitle(),
        ],
      ),
    );
  }
}
