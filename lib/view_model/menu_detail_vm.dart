import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/model/person.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:becos_kitchen/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuDetailViewModelFamily = StateNotifierProvider.family
    .autoDispose<MenuDetailViewModel, MenuModel, MenuModel>(
  (ref, menu) => MenuDetailViewModel(
    ref.watch(userRepositoryProvider),
    ref.watch(menuRepositoryProvider),
    menu: menu,
  ),
);
final menuDetailViewModelProvider =
    StateNotifierProvider.autoDispose<MenuDetailViewModel, MenuModel>(
        (ref) => throw UnimplementedError());

class MenuDetailViewModel extends StateNotifier<MenuModel> {
  MenuDetailViewModel(this._userRepository, this._menuRepository,
      {required MenuModel menu})
      : super(menu);

  final UserRepository _userRepository;
  final MenuRepository _menuRepository;

  Person getUser() {
    return Person.getPersonFromUid(state.uid);
  }

  Person currentUser() {
    return _userRepository.currentUser;
  }

  bool hasMemo() {
    return state.memo.isNotEmpty;
  }

  double getMyRate() {
    switch (currentUser()) {
      case Person.baek:
        return state.rateBaek.toDouble();
      case Person.akane:
        return state.rateAkane.toDouble();
      default:
        return state.rateBaek.toDouble();
    }
  }

  void setRate(double newValue) {
    switch (currentUser()) {
      case Person.baek:
        state = state.copyWith(rateBaek: newValue.toInt());
        break;
      case Person.akane:
        state = state.copyWith(rateAkane: newValue.toInt());
        break;
      default:
        break;
    }
  }

  Future<void> updateMenu() async {
    _menuRepository.updateMenuData(state);
  }
}
