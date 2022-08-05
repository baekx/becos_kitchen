import 'package:flutter/material.dart';

class ButtonExpanded extends StatelessWidget {
  const ButtonExpanded(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.backgroundColor})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(primary: backgroundColor),
        ));
  }
}
