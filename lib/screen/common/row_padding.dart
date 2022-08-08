import 'package:flutter/material.dart';

class RowPadding extends StatelessWidget {
  const RowPadding({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
