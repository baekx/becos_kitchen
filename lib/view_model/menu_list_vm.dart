import 'package:becos_kitchen/model/menu.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:becos_kitchen/repository/menu_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuListViewModel extends StateNotifier<AsyncValue<List<Menu>>> {
  MenuListViewModel() : super(const AsyncValue.loading()) {
    _getMenuList();
  }

  final MenuRepository repository = MenuRepositoryImpl();

  Future<void> _getMenuList() async {
    try {
      final menuList = await repository.fetchMenuList();
      state = AsyncValue.data(menuList);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
