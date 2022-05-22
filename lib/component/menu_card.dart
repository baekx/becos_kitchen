import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: 100,
          width: double.infinity,
          child: Column(
            children: [Image.asset('assets/images/chige.png')],
          ),
        ),
      ),
    );
  }
}
