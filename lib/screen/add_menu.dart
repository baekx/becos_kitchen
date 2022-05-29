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
          Text("画像"),
          Text("タイトル"),
          Text("作成日"),
        ],
      ),
    );
  }
}
