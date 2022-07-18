import 'package:becos_kitchen/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuRate extends ConsumerWidget {
  const MenuRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int rate = ref.watch(addMenuPageProvider).rate;

    return Center(
      child: RatingBar.builder(
          itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
          initialRating: rate.toDouble(),
          itemPadding: EdgeInsets.symmetric(horizontal: 16.0),
          itemSize: 40.0,
          onRatingUpdate: (rating) {
            ref.watch(addMenuPageProvider.notifier).setRate(rating.toInt());
          }),
    );
  }
}
