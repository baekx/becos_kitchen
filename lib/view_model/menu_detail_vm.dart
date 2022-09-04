import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/model/person.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuDetailViewModelFamily = StateNotifierProvider.family
    .autoDispose<MenuDetailViewModel, MenuModel, MenuModel>(
        (ref, menu) => MenuDetailViewModel(menu: menu));
final menuDetailViewModelProvider =
    StateNotifierProvider.autoDispose<MenuDetailViewModel, MenuModel>(
        (ref) => throw UnimplementedError());

class MenuDetailViewModel extends StateNotifier<MenuModel> {
  MenuDetailViewModel({required MenuModel menu})
      : _menu = menu,
        super(MenuModel(
            name: menu.name,
            image: menu.image,
            createdAt: menu.createdAt,
            rate: menu.rate,
            url: menu.url,
            tag: menu.tag,
            memo: menu.memo));

  final MenuModel _menu;

  Person getUser() {
    return Person.values
            .firstWhereOrNull((element) => element.uid == state.uid) ??
        Person.baek;
  }

  bool hasMemo() {
    return state.memo.isNotEmpty;
  }
}
