import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset("assets/images/chige.png"),
            Wrap(
              spacing: 4.0,
              children: _menuTagList,
            )
          ],
        ),
      ),
    );
  }
}

final List<Widget> _menuTagList = [
  _buildChip("さっぱり", Colors.blue),
  _buildChip("こってり", Colors.orange),
  _buildChip("かんたん", Colors.yellow),
  _buildChip("かんたん", Colors.yellow),
  _buildChip("かんたん", Colors.yellow),
  _buildChip("かんたん", Colors.yellow),
  _buildChip("かんたん", Colors.yellow),
  _buildChip("かんたん", Colors.yellow),
  _buildChip("かんたん", Colors.yellow),
  _buildChip("かんたん", Colors.yellow),
  _buildChip("かんたん", Colors.yellow),
];

Widget _buildChip(String label, Color color) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.black, fontSize: 10),
      ),
      backgroundColor: color,
    ),
  );
}
