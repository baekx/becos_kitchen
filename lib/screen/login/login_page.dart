import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/model/user.dart';
import 'package:becos_kitchen/screen/common/circle_user_avatar.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list_page.dart';
import 'package:becos_kitchen/view_model/login_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginViewModelProvider.notifier);
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
          children: [
            GestureDetector(
              onTap: () {
                vm.setUser(User.baek);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MenuListPage(),
                  ),
                );
              },
              child: const CircleUserAvatar(
                size: 72,
                user: User.baek,
              ),
            ),
            GestureDetector(
              onTap: () {
                vm.setUser(User.akane);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MenuListPage(),
                  ),
                );
              },
              child: const CircleUserAvatar(
                size: 72,
                user: User.akane,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
