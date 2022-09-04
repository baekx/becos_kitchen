import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/model/person.dart';
import 'package:becos_kitchen/screen/common/circle_user_avatar.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateChangeDialog extends StatelessWidget {
  const RateChangeDialog({Key? key, required this.person}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const ColumnPadding(height: 16),
        const Text(
          'お気に入り度を変更',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const ColumnPadding(height: 16),
        CircleUserAvatar(
          size: 40,
          icon: person.imagePath,
        ),
        const ColumnPadding(height: 16),
        RatingBar.builder(
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (_) {},
          itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          initialRating: 3.0,
        ),
        const ColumnPadding(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: const Color(textColor)),
                // onPressed: onPressedEnd,
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
            const RowPadding(width: 6),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: const Color(green)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '変更',
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
