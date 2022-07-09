import 'dart:io';

import 'package:becos_kitchen/component/expandable_fab.dart';
import 'package:becos_kitchen/component/menu_card.dart';
import 'package:becos_kitchen/screen/add_menu/add_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class MenuListPage extends ConsumerStatefulWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends ConsumerState<MenuListPage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            title: Row(
              children: [
                Container(
                  width: 280,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.clear)),
                          hintText: "今日はなに食べよう？"),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 20,
                      height: 20,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/sort.svg',
                      width: 20,
                      height: 20,
                    )),
              ],
            ),
          ),
        ),
        floatingActionButton: ExpandableFab(
          distance: 80.0,
          children: [
            ActionButton(
                onPressed: () => _getImage(ImageSource.camera),
                icon: const Icon(Icons.add_a_photo)),
            ActionButton(
                onPressed: () => _getImage(ImageSource.gallery),
                icon: const Icon(Icons.photo_album)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            children: [
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
            ],
          ),
        ));
  }

  Future _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddMenuPage(image: _image)));
  }
}
