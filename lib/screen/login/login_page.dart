import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/model/user.dart';
import 'package:becos_kitchen/screen/common/circle_user_avatar.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(textBlack),
          ),
          child: Text('ログイン'),
        ),
        const ColumnPadding(height: 8),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CircleUserAvatar(
              size: 72,
              user: User.baek,
            ),
            CircleUserAvatar(
              size: 72,
              user: User.akane,
            ),
          ],
        ),
      ]),
    );
  }
}
