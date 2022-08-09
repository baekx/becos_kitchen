import 'package:becos_kitchen/data/shared_preferences_module.dart';
import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/model/user.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final menuListViewModelProvider = StateNotifierProvider.autoDispose<
    MenuListViewModel, AsyncValue<List<MenuModel>>>(
  (ref) => MenuListViewModel(
      ref.read(menuRepositoryProvider), ref.read(sharedPreferencesProvider)
      // ref.read(loginRepositoryProvider),
      ),
);

class MenuListViewModel extends StateNotifier<AsyncValue<List<MenuModel>>> {
  MenuListViewModel(this._menuRepository, this.prefs)
      : super(const AsyncValue.loading()) {
    getMenuList();
  }

  final MenuRepository _menuRepository;
  final SharedPreferences prefs;
  // final LoginRepository _loginRepository;

  Future<void> getMenuList() async {
    try {
      final menuList = await _menuRepository.fetchMenuList();
      state = AsyncValue.data(menuList);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }

  User? getUser() {
    final userName = prefs.getString('user');
    return User.values.firstWhere((element) => element.name == userName);
  }
}
