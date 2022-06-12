import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 8),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: Colors.blue),
      ),
    );
  }
}
