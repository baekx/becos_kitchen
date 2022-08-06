import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/view_model/add_menu_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MenuDatePicker extends ConsumerWidget {
  const MenuDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addMenuViewModelProvider);
    final vm = ref.watch(addMenuViewModelProvider.notifier);
    initializeDateFormatting('ja');
    final dateString = DateFormat.yMMMEd('ja').format(state.createdAt!);

    return GestureDetector(
      onTap: () => vm.onTapDatePicker(context),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(textColor), width: 0.5),
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
                  // Navigator.of(context).pop();
                },
              ),
              Expanded(
                child: Center(
                  child: Text(
                    dateString,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
