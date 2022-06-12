import 'package:flutter/material.dart';

class MenuTitle extends StatelessWidget {
  const MenuTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        top: 24.0,
        right: 24.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blue, width: 2.0)),
            labelStyle: TextStyle(fontSize: 12, color: Colors.blue[300]),
            labelText: "タイトル",
            floatingLabelStyle: TextStyle(fontSize: 14),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blue[100]!, width: 1.0))),
      ),
    );
  }
}
