import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/model/person.dart';
import 'package:becos_kitchen/screen/common/circle_user_avatar.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:becos_kitchen/screen/menu_detail/rate_change_dialog.dart';
import 'package:becos_kitchen/view_model/menu_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDetailRating extends ConsumerWidget {
  const MenuDetailRating(this.person, {Key? key}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menu = ref.watch(menuDetailViewModelProvider);
    final vm = ref.watch(menuDetailViewModelProvider.notifier);
    return GestureDetector(
      onTap: () {
        if (vm.currentUser() == person) {
          showDialog(
            context: context,
            builder: (_) {
              return RateChangeDialog(person: person);
            },
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleUserAvatar(
            size: 40,
            icon: person.imagePath,
          ),
          const RowPadding(width: 8),
          RatingBar.builder(
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Color(starYellow),
            ),
            itemCount: 5,
            itemSize: 24,
            initialRating: person.isBaek
                ? menu.rateBaek.toDouble()
                : menu.rateAkane.toDouble(),
            ignoreGestures: true,
            onRatingUpdate: (_) {},
          )
        ],
      ),
    );
  }
}
