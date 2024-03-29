import 'package:becos_kitchen/screen/common/circle_user_avatar.dart';
import 'package:becos_kitchen/screen/common/custom_alert_dialog.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:becos_kitchen/view_model/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuListHeader extends ConsumerWidget {
  const MenuListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginVm = ref.watch(loginViewModelProvider.notifier);
    final user = ref.watch(userStateProvider).value;

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return CustomAlertDialog(
                    proceedButtonText: 'ログアウト',
                    description: 'ログアウトしますか？',
                    onPressedEnd: () async {
                      await loginVm.signOut();
                      Navigator.of(context).pop();
                    },
                  );
                },
              );
            },
            icon: CircleUserAvatar(
                size: 56, icon: loginVm.getUserIcon(user?.uid)),
          ),
          const Expanded(child: Center(child: Text('ホーム'))),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 16,
              height: 16,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          const RowPadding(width: 16),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
              width: 16,
              height: 16,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          const RowPadding(width: 16),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/sort.svg',
              width: 14,
              height: 14,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
