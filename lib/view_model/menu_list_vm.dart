import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuListViewModelProvider = StateNotifierProvider.autoDispose<
    MenuListViewModel, AsyncValue<List<MenuModel>>>(
  (ref) => MenuListViewModel(
    ref.read(menuRepositoryProvider),
  ),
);

class MenuListViewModel extends StateNotifier<AsyncValue<List<MenuModel>>> {
  MenuListViewModel(this._menuRepository) : super(const AsyncValue.loading()) {
    getMenuList();
  }

  final MenuRepository _menuRepository;

  Future<void> getMenuList() async {
    try {
      final menuList = await _menuRepository.fetchMenuList();
      state = AsyncValue.data(menuList);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
