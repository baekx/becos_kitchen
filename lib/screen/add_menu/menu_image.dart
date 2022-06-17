import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MenuImage extends StatelessWidget {
  const MenuImage({Key? key, this.imagePath}) : super(key: key);
  final File? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: 300,
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: imagePath != null
                ? Image(image: FileImage(imagePath!), fit: BoxFit.cover)
                : const Image(
                    image: AssetImage("assets/images/noImage.png"),
                    fit: BoxFit.cover)),
      ),
      const Align(
        alignment: Alignment(1, -1),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.change_circle, size: 40),
          // child: IconButton(
          //     icon: Icon(Icons.change_circle), iconSize: 40, onPressed: () {}),
        ),
      )
    ]);
  }

  // TODO: 写真入れ替えメソッド
  Future _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  }
}
