import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:becos_kitchen/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuListViewModelProvider = StateNotifierProvider.autoDispose<
    MenuListViewModel, AsyncValue<List<MenuModel>>>(
  (ref) => MenuListViewModel(
    ref.read(menuRepositoryProvider),
    ref.read(userRepositoryProvider),
  ),
);

class MenuListViewModel extends StateNotifier<AsyncValue<List<MenuModel>>> {
  MenuListViewModel(this._menuRepository, this._loginRepository)
      : super(const AsyncValue.loading()) {
    getMenuList();
  }

  final MenuRepository _menuRepository;
  final UserRepository _loginRepository;

  Future<void> getMenuList() async {
    try {
      final menuList = await _menuRepository.fetchMenuList();
      state = AsyncValue.data(menuList);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }

  // User? getUser() {
  //   return _loginRepository.getUser();
  // }
}
