import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/model/user.dart';
import 'package:becos_kitchen/screen/common/circle_user_avatar.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:becos_kitchen/view_model/menu_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDetailRating extends ConsumerWidget {
  const MenuDetailRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menu = ref.watch(menuDetailViewModelProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleUserAvatar(
          size: 40,
          user: User.akane,
        ),
        const RowPadding(width: 8),
        RatingBar.builder(
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Color(starYellow),
          ),
          itemCount: 5,
          itemSize: 24,
          initialRating: menu.rate.toDouble(),
          ignoreGestures: true,
          onRatingUpdate: (_) {},
        )
      ],
    );
  }
}
