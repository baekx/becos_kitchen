import 'package:flutter/material.dart';

class ColumnPadding extends StatelessWidget {
  const ColumnPadding({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
