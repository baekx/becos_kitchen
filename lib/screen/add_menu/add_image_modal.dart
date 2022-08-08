import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/screen/common/button_expanded.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:flutter/material.dart';

class AddImageModal extends StatelessWidget {
  const AddImageModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ColumnPadding(height: 24),
        Image.asset("assets/images/drug_bar.png"),
        const ColumnPadding(height: 24),
        _ExpandedButtonWithBorder(
          text: 'カメラを起動',
          onPressed: () {},
        ),
        const ColumnPadding(height: 16),
        _ExpandedButtonWithBorder(
          text: 'ライブラリから選択',
          onPressed: () {},
        ),
        const ColumnPadding(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ButtonExpanded(
            text: 'キャンセル',
            backgroundColor: const Color(textColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}

class _ExpandedButtonWithBorder extends StatelessWidget {
  const _ExpandedButtonWithBorder(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        height: 42,
        child: OutlinedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                color: Color(green),
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              primary: const Color(lightGreen),
              backgroundColor: const Color(lightGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: const BorderSide(color: Color(green), width: 2),
            )),
      ),
    );
  }
}
