import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddMenuScreen extends StatefulWidget {
  const AddMenuScreen({Key? key}) : super(key: key);

  @override
  _AddMenuScreenState createState() => _AddMenuScreenState();
}

class _AddMenuScreenState extends State<AddMenuScreen> {
  final ImagePicker _picker = ImagePicker();
  final _files = <File>[];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemSize = size.width / 4;

    return Scaffold(
      appBar: AppBar(
        title: Text("メニュー追加"),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TitleTextField(),
          SizedBox(height: 40),
          if (_files.length < 9)
            OutlinedButton(
                onPressed: () async {
                  final List<XFile>? _images = await _picker.pickMultiImage();
                  _files.addAll(
                      _images?.map((e) => File(e.path)) ?? List.empty());
                  setState(() {});
                },
                child: Container(
                  child: Icon(Icons.add_a_photo),
                )),
          Padding(
            padding: const EdgeInsets.only(
              top: 40.0,
              left: 40.0,
              right: 40.0,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: _files.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_files.isNotEmpty)
                      SizedBox(
                        width: itemSize,
                        height: itemSize,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_files[index], fit: BoxFit.fill)),
                      ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
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
