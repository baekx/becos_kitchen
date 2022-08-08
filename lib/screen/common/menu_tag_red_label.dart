import 'package:flutter/material.dart';

class MenuTagRedLabel extends StatelessWidget {
  const MenuTagRedLabel({Key? key, required this.label}) : super(key: key);

  final String label;
  // final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Chip(
          label: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
          backgroundColor: const Color(0xffAF5F56),
          materialTapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // 追加：上下の余計なmarginを削除
          labelPadding: const EdgeInsets.symmetric(
              horizontal: 4), // 追加：文字左右の多すぎるpaddingを調整
          visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4)),
    );
  }
}
