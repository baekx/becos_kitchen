import 'package:flutter/material.dart';

class AddMenuScreen extends StatelessWidget {
  const AddMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("メニュー追加"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              top: 80.0,
              right: 40.0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.green, width: 2.0)),
                  labelStyle: TextStyle(fontSize: 12, color: Colors.green[300]),
                  labelText: "Menu Title",
                  floatingLabelStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          BorderSide(color: Colors.green[100]!, width: 1.0))),
            ),
          )
        ],
      ),
    );
  }
}
