import 'package:flutter/material.dart';

class MenuTagList extends StatelessWidget {
  const MenuTagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.blue[100]!),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Wrap(
        spacing: 16.0,
        children: _menuTagList,
      ),
    );
  }
}

class AddMenuTag extends StatelessWidget {
  const AddMenuTag({Key? key, required this.label, required this.color})
      : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: SizedBox(
          child: Chip(
            label: Text(label,
                style: const TextStyle(color: Colors.white, fontSize: 14)),
            backgroundColor: color,
          ),
        ));
  }
}

final List<Widget> _menuTagList = [
  AddMenuTag(label: "和", color: Colors.orangeAccent),
  AddMenuTag(label: "洋", color: Colors.green),
  AddMenuTag(label: "中華", color: Colors.red),
  AddMenuTag(label: "エスニック", color: Colors.deepPurpleAccent),
  AddMenuTag(label: "さっぱり", color: Colors.blue),
  AddMenuTag(label: "こってり", color: Colors.orange),
  AddMenuTag(label: "豪華", color: Colors.pinkAccent),
  AddMenuTag(label: "時短", color: Colors.yellow),
];
