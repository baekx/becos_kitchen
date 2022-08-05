import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class MenuImage extends StatelessWidget {
  const MenuImage({Key? key, this.imagePath}) : super(key: key);
  final File? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: SizedBox(
          width: double.infinity,
          height: 360,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: imagePath != null
                  ? Image(image: FileImage(imagePath!), fit: BoxFit.cover)
                  : const Image(
                      image: AssetImage("assets/images/noImage.png"),
                      fit: BoxFit.cover)),
        ),
      ),
      GestureDetector(
          child: SvgPicture.asset('assets/icons/change.svg'), onTap: () {}),
    ]);
  }

  // TODO: 写真入れ替えメソッド
  Future _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  }
}
