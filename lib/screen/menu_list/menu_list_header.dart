import 'package:becos_kitchen/model/user.dart';
import 'package:becos_kitchen/screen/common/circle_user_avatar.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:becos_kitchen/view_model/login_vm.dart';
import 'package:becos_kitchen/view_model/menu_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuListHeader extends ConsumerWidget {
  const MenuListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(menuListViewModelProvider.notifier);
    final loginVm = ref.watch(loginViewModelProvider.notifier);
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      title: Row(
        children: [
          IconButton(
            onPressed: () async {
              await loginVm.signOut();
            },
            icon: CircleUserAvatar(size: 40, user: User.baek),
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
