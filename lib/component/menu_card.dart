import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset("assets/images/chige.png")),
          Container(
            alignment: Alignment.center,
            child: Wrap(
              spacing: 4.0,
              children: _menuTagList,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "キムチチゲ",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
          )
        ],
      ),
    );
  }
}

final List<Widget> _menuTagList = [
  _buildChip("さっぱり", Colors.blue),
  _buildChip("こってり", Colors.orange),
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
