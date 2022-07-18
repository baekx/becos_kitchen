import 'package:flutter/material.dart';

class ButtonExpanded extends StatelessWidget {
  const ButtonExpanded({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(onPressed: onPressed, child: Text(text)));
  }
}
