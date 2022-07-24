import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuTitle extends ConsumerWidget {
  const MenuTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: Color(textColor), width: 2.0)),
          labelStyle: TextStyle(fontSize: 12, color: Color(textColor)),
          floatingLabelStyle: const TextStyle(fontSize: 14),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(textColor), width: 1.0))),
      onChanged: (text) {
        ref.watch(addMenuPageProvider.notifier).setTitle(text);
      },
    );
  }
}
