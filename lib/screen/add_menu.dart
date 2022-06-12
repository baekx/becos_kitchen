import 'package:flutter/material.dart';

class AddMenuScreen extends StatefulWidget {
  const AddMenuScreen({Key? key}) : super(key: key);

  @override
  _AddMenuScreenState createState() => _AddMenuScreenState();
}

class _AddMenuScreenState extends State<AddMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("メニュー追加"),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          MenuImage(imagePath: "assets/images/noImage.png"),
          TitleTextField(),
        ],
      ),
    );
  }
}

class MenuImage extends StatelessWidget {
  const MenuImage({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(imagePath),
        )));
  }
}

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            labelText: "メニューの名前",
            floatingLabelStyle: TextStyle(fontSize: 12),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.green[100]!, width: 1.0))),
      ),
    );
  }
}
