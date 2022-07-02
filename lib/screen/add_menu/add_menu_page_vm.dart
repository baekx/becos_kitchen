import 'package:becos_kitchen/model/menu_state.dart';
import 'package:becos_kitchen/repository/menu_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMenuPageStateNotifier extends StateNotifier<MenuState> {
  AddMenuPageStateNotifier() : super(const MenuState(title: '', score: 1));

  void setTitle(String newTitle) {
    state = state.copyWith(title: newTitle);
  }

  void setRate(int newScore) {
    state = state.copyWith(score: newScore);
  }

  void addMenu() {
    MenuDao.setMenu(state);
  }

  // void onImageChanged(File file) {
  //   _ref.read(_pickerImageProvider.notifier).update((state) => file);
  // }
}
