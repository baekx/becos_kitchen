import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuListViewModelProvider = StateNotifierProvider.autoDispose<
    MenuListViewModel, AsyncValue<Stream<List<MenuModel>>>>(
  (ref) => MenuListViewModel(
    ref.read(menuRepositoryProvider),
  ),
);

class MenuListViewModel
    extends StateNotifier<AsyncValue<Stream<List<MenuModel>>>> {
  MenuListViewModel(this._menuRepository) : super(const AsyncValue.loading()) {
    getMenuList();
  }

  final MenuRepository _menuRepository;

  void getMenuList() {
    try {
      final collection = _menuRepository.menuListSnapshot();
      final stream =
          collection.map((event) => event.docs.map((e) => e.data()).toList());
      state = AsyncValue.data(stream);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
