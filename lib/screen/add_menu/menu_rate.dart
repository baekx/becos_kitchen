import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuRate extends StatelessWidget {
  const MenuRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar.builder(
          itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
          initialRating: 3,
          itemPadding: EdgeInsets.symmetric(horizontal: 16.0),
          itemSize: 40.0,
          onRatingUpdate: (rating) {}),
    );
  }
}
