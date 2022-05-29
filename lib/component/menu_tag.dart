import 'package:flutter/material.dart';

class MenuTag extends StatelessWidget {
  const MenuTag({Key? key, required this.label, required this.color})
      : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Chip(
          label: Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 8),
          ),
          backgroundColor: color,
          materialTapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // 追加：上下の余計なmarginを削除
          labelPadding: const EdgeInsets.symmetric(
              horizontal: 1), // 追加：文字左右の多すぎるpaddingを調整
          visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4)),
    );
  }
}
