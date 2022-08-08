import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/screen/common/column_padding.dart';
import 'package:becos_kitchen/view_model/add_menu_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuImage extends ConsumerWidget {
  const MenuImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addMenuViewModelProvider);
    final vm = ref.watch(addMenuViewModelProvider.notifier);
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: SizedBox(
            width: double.infinity,
            height: 260,
            child: GestureDetector(
              onTap: () => vm.setImage(),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  child: state.imageFile != null
                      ? Image(
                          image: FileImage(state.imageFile!), fit: BoxFit.cover)
                      : const Image(
                          image: AssetImage(
                              "assets/images/add_image_background.png"),
                          fit: BoxFit.fill)),
            ),
          ),
        ),
        Visibility(
          visible: state.imageFile == null,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/add_image.svg',
                width: 38,
                height: 38,
              ),
              const ColumnPadding(height: 8),
              const Text(
                '写真を追加',
                style: TextStyle(fontSize: 12, color: Color(green)),
              )
            ],
          ),
        )
      ],
    );
  }
}
