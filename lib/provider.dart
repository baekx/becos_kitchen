import 'package:becos_kitchen/model/menu_state.dart';
import 'package:becos_kitchen/screen/add_menu/add_menu_page_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addMenuPageProvider =
    StateNotifierProvider<AddMenuPageStateNotifier, MenuState>(
        (ref) => AddMenuPageStateNotifier());
