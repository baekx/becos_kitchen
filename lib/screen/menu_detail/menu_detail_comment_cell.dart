import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/model/user.dart';
import 'package:becos_kitchen/screen/common/circle_user_avatar.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:flutter/material.dart';

class MenuDetailCommentCell extends StatelessWidget {
  const MenuDetailCommentCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleUserAvatar(size: 40, user: User.baek),
          const RowPadding(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2022/12/24',
                  style: TextStyle(fontSize: 10, color: Color(textColor)),
                ),
                Text(
                  'おいしかったよ！',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
