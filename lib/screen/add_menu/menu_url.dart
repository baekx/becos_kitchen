import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/view_model/add_menu_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuUrl extends ConsumerWidget {
  const MenuUrl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(addMenuViewModelProvider.notifier);
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: Color(textColor), width: 0.5)),
          labelStyle: TextStyle(fontSize: 12, color: Color(textColor)),
          floatingLabelStyle: const TextStyle(fontSize: 14),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(textColor), width: 0.5))),
      onChanged: (text) {
        vm.setUrl(text);
      },
    );
  }
}
