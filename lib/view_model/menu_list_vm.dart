import 'package:becos_kitchen/model/menu.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:becos_kitchen/repository/menu_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuListViewModelProvider = StateNotifierProvider.autoDispose<
    MenuListViewModel, AsyncValue<List<Menu>>>((ref) => MenuListViewModel());

class MenuListViewModel extends StateNotifier<AsyncValue<List<Menu>>> {
  MenuListViewModel() : super(const AsyncValue.loading()) {
    getMenuList();
  }

  final MenuRepository repository = MenuRepositoryImpl();

  Future<void> getMenuList() async {
    try {
      final menuList = await repository.fetchMenuList();
      state = AsyncValue.data(menuList);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
