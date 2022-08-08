import 'package:becos_kitchen/view_model/add_menu_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuRate extends ConsumerWidget {
  const MenuRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(addMenuViewModelProvider.notifier);

    return Center(
      child: RatingBar.builder(
          itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
          initialRating: 3.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemSize: 32.0,
          onRatingUpdate: (rating) {
            vm.setRate(rating.toInt());
          }),
    );
  }
}
