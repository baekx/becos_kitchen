import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/view_model/add_menu_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuTagList extends ConsumerWidget {
  const MenuTagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: const Color(textColor)),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: const AddMenuTag());
  }
}

class AddMenuTag extends ConsumerStatefulWidget {
  const AddMenuTag({Key? key}) : super(key: key);

  @override
  _AddMenuTagState createState() => _AddMenuTagState();
}

class _AddMenuTagState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(addMenuViewModelProvider.notifier);
    return Wrap(
        children: MenuTag.values
            .map(
              (menuTag) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: FilterChip(
                  label: Text(
                    menuTag.name,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  backgroundColor: const Color(cancel),
                  selected: vm.hasTag(menuTag),
                  selectedColor: const Color(mainRed),
                  showCheckmark: false,
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        vm.setTag(menuTag);
                      } else {
                        vm.removeTag(menuTag);
                      }
                    });
                  },
                ),
              ),
            )
            .toList());
  }
}

enum MenuTag {
  japanese("和"),
  western("洋"),
  chinese("中華"),
  ethnic("エスニック"),
  cool("さっぱり"),
  oily("こってり"),
  luxury("豪華"),
  quick("時短");

  final String name;
  const MenuTag(this.name);
}
