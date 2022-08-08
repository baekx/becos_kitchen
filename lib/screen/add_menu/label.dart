import 'package:becos_kitchen/common/material_color.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12, color: Color(textColor)),
    );
  }
}
