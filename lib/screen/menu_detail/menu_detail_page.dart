import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/screen/menu_detail/menu_detail_body.dart';
import 'package:becos_kitchen/view_model/menu_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({Key? key, required this.menu}) : super(key: key);
  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        menuDetailViewModelProvider
            .overrideWithProvider(menuDetailViewModelFamily(menu))
      ],
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              '詳細',
              style: TextStyle(color: Color(textColor)),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset('assets/icons/backArrow.svg'))),
        body: const MenuDetailBody(),
      ),
    );
  }
}
