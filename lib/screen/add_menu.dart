import 'dart:io';

import 'package:flutter/material.dart';

class AddMenuScreen extends StatelessWidget {
  const AddMenuScreen({Key? key, this.image}) : super(key: key);
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("メニュー追加"),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          MenuImage(imagePath: image),
          TitleTextField(),
        ],
      ),
    );
  }
}

class MenuImage extends StatelessWidget {
  const MenuImage({Key? key, this.imagePath}) : super(key: key);
  final File? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        child: imagePath != null
            ? Image(image: FileImage(imagePath!))
            : Image(image: AssetImage("assets/images/noImage.png")));
  }
}

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40.0,
        top: 80.0,
        right: 40.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.green, width: 2.0)),
            labelStyle: TextStyle(fontSize: 12, color: Colors.green[300]),
            labelText: "メニューの名前",
            floatingLabelStyle: TextStyle(fontSize: 12),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.green[100]!, width: 1.0))),
      ),
    );
  }
}
