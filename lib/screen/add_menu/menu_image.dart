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
    return Stack(alignment: Alignment.bottomRight, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: SizedBox(
          width: double.infinity,
          height: 360,
          child: GestureDetector(
            onTap: () => vm.setImage(),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: state.imageFile != null
                    ? Image(
                        image: FileImage(state.imageFile!), fit: BoxFit.cover)
                    : const Image(
                        image: AssetImage("assets/images/noImage.png"),
                        fit: BoxFit.cover)),
          ),
        ),
      ),
      GestureDetector(
        child: SvgPicture.asset('assets/icons/change.svg'),
        onTap: () => vm.setImage(),
      ),
    ]);
  }
}
