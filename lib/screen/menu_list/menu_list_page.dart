import 'dart:io';

import 'package:becos_kitchen/component/expandable_fab.dart';
import 'package:becos_kitchen/provider.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            toolbarHeight: 80,
            title: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 280,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true,
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search),
                                iconSize: 24),
                            hintText: "今日はなに食べよう？"),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 16,
                      height: 16,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/sort.svg',
                      width: 16,
                      height: 16,
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
        body: _MenuList());
  }

  Future _getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    File? _image;
    final pickedFile = await _picker.pickImage(source: source);

    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //   }
    // });

    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => AddMenuPage(image: _image)));
  }
}

class _MenuList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuList = ref.watch(menuListProvider);

    return menuList.when(
        data: (data) => MenuList(menuList: data),
        error: (_, stackTrace) => const Center(
              child: Text('データ取得に失敗しました'),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
