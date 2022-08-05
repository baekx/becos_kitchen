import 'package:becos_kitchen/model/menu.dart';
import 'package:becos_kitchen/view_model/menu_list_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuListProvider = StateNotifierProvider.autoDispose<MenuListViewModel,
    AsyncValue<List<Menu>>>((ref) => MenuListViewModel());
