import 'dart:io';

import 'package:flutter/material.dart';

class MenuImage extends StatelessWidget {
  const MenuImage({Key? key, this.imagePath}) : super(key: key);
  final File? imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: imagePath != null
              ? Image(image: FileImage(imagePath!), fit: BoxFit.cover)
              : Image(
                  image: AssetImage("assets/images/noImage.png"),
                  fit: BoxFit.cover)),
    );
  }
}
