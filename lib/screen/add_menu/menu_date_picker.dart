import 'package:becos_kitchen/common/material_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDatePicker extends ConsumerWidget {
  const MenuDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(textColor), width: 0.5),
          borderRadius: BorderRadius.circular(16)),
      height: 56,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/calendar.svg',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Center(
                  child: Text('2022/08/05(金)', style: TextStyle(fontSize: 16))),
            )
          ],
        ),
      ),
    );
  }
}
