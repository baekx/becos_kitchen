import 'package:becos_kitchen/common/material_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddMenuSecondPage extends ConsumerWidget {
  const AddMenuSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "料理を追加",
          style: TextStyle(color: Color(green)),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
              icon: SvgPicture.asset('assets/icons/cancel.svg'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }
}
