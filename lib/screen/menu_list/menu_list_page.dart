import 'package:becos_kitchen/component/expandable_fab.dart';
import 'package:becos_kitchen/provider.dart';
import 'package:becos_kitchen/screen/add_menu/add_menu_first_page.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list.dart';
import 'package:becos_kitchen/screen/menu_list/menu_list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80), child: MenuListHeader()),
        floatingActionButton: ExpandableFab(
          distance: 80.0,
          children: [
            ActionButton(
                onPressed: () => _getImage(context, ImageSource.camera),
                icon: const Icon(Icons.add_a_photo)),
            ActionButton(
                onPressed: () => _getImage(context, ImageSource.gallery),
                icon: const Icon(Icons.photo_album)),
          ],
        ),
        body: _MenuList());
  }

  // TODO:
  Future _getImage(BuildContext context, ImageSource source) async {
    // final ImagePicker _picker = ImagePicker();
    // File? _image;
    // final pickedFile = await _picker.pickImage(source: source);
    //
    // if (pickedFile != null) {
    //   _image = File(pickedFile.path);
    // }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddMenuFirstPage()));
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
