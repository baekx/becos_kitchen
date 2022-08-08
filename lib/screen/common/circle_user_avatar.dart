import 'package:becos_kitchen/model/user.dart';
import 'package:flutter/material.dart';

class CircleUserAvatar extends StatelessWidget {
  const CircleUserAvatar({Key? key, required this.size, required this.user})
      : super(key: key);
  final double size;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(user.imagePath),
        ),
      ),
    );
  }
}
