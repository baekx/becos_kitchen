import 'package:flutter/material.dart';

class ButtonExpanded extends StatelessWidget {
  const ButtonExpanded({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(onPressed: () {}, child: Text(text)));
  }
}
