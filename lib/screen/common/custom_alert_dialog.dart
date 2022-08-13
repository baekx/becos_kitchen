import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {Key? key,
      this.onPressedEnd,
      required this.description,
      required this.proceedButtonText})
      : super(key: key);
  final VoidCallback? onPressedEnd;
  final String description;
  final String proceedButtonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const ColumnPadding(height: 16),
        Text(
          description,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const ColumnPadding(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: const Color(textColor)),
                onPressed: onPressedEnd,
                child: Text(
                  proceedButtonText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const RowPadding(width: 6),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: const Color(green)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'キャンセル',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const ColumnPadding(height: 16),
          ],
        )
      ]),
    );
  }
}
