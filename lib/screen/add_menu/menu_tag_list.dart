import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/model/menu_tag.dart';
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
            borderRadius: const BorderRadius.all(Radius.circular(8))),
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
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                child: FilterChip(
                  label: Text(
                    menuTag.name,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  backgroundColor: const Color(textColor),
                  selected: vm.hasTag(menuTag),
                  selectedColor: const Color(mainRed),
                  showCheckmark: false,
                  onSelected: (bool value) {
                    FocusManager.instance.primaryFocus?.unfocus();
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
