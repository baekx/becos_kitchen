import 'package:becos_kitchen/model/menu_state.dart';
import 'package:becos_kitchen/view_model/add_menu_page_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addMenuPageProvider =
    StateNotifierProvider<AddMenuPageStateNotifier, MenuState>(
        (ref) => AddMenuPageStateNotifier());
