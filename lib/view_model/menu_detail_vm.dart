import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/model/person.dart';
import 'package:becos_kitchen/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuDetailViewModelFamily = StateNotifierProvider.family
    .autoDispose<MenuDetailViewModel, MenuModel, MenuModel>((ref, menu) =>
        MenuDetailViewModel(ref.watch(userRepositoryProvider), menu: menu));
final menuDetailViewModelProvider =
    StateNotifierProvider.autoDispose<MenuDetailViewModel, MenuModel>(
        (ref) => throw UnimplementedError());

class MenuDetailViewModel extends StateNotifier<MenuModel> {
  MenuDetailViewModel(this._userRepository, {required MenuModel menu})
      : _menu = menu,
        super(MenuModel(
            name: menu.name,
            image: menu.image,
            createdAt: menu.createdAt,
            rateBaek: menu.rateBaek,
            rateAkane: menu.rateAkane,
            url: menu.url,
            tag: menu.tag,
            memo: menu.memo));

  final MenuModel _menu;
  final UserRepository _userRepository;

  Person getUser() {
    return Person.getPersonFromUid(state.uid);
  }

  Person currentUser() {
    return _userRepository.currentUser;
  }

  bool hasMemo() {
    return state.memo.isNotEmpty;
  }
}
