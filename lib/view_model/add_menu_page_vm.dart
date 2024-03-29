import 'dart:io';

import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/add_menu_state.dart';
import 'package:becos_kitchen/model/menu_tag.dart';
import 'package:becos_kitchen/model/person.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:becos_kitchen/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final addMenuViewModelProvider =
    StateNotifierProvider.autoDispose<AddMenuViewModel, AddMenuState>(
        (ref) => AddMenuViewModel(
              ref.read(menuRepositoryProvider),
              ref.read(userRepositoryProvider),
            ));

class AddMenuViewModel extends StateNotifier<AddMenuState> {
  AddMenuViewModel(this._menuRepository, this._userRepository)
      : super(AddMenuState(
          name: '',
          tag: [],
          rateAkane: 0,
          rateBaek: 0,
          createdAt: DateTime.now(),
          url: '',
          memo: '',
          uid: '',
        ));

  final MenuRepository _menuRepository;
  final UserRepository _userRepository;

  void setTitle(String newTitle) {
    state = state.copyWith(name: newTitle);
  }

  void setTag(MenuTag menuTag) {
    var list = List.of(state.tag);
    list.add(menuTag.name);
    state = state.copyWith(tag: list);
  }

  void removeTag(MenuTag menuTag) {
    var list = List.of(state.tag);
    list.remove(menuTag.name);
    state = state.copyWith(tag: list);
  }

  bool hasTag(MenuTag menuTag) {
    return state.tag.contains(menuTag.name);
  }

  void setRate(int newScore) {
    switch (_userRepository.currentUser) {
      case Person.baek:
        state = state.copyWith(rateBaek: newScore);
        break;
      case Person.akane:
        state = state.copyWith(rateAkane: newScore);
        break;
      default:
        break;
    }
  }

  Future<void> setImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;
    state = state.copyWith(imageFile: File(pickedFile.path));
  }

  void setCreatedAt(DateTime newDate) {
    state = state.copyWith(createdAt: newDate);
  }

  void onTapDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      locale: const Locale("ja"),
      context: context,
      initialDate: state.createdAt!,
      firstDate: DateTime(2022),
      lastDate: DateTime.now().add(const Duration(days: 360)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: Colors.orange),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setCreatedAt(picked);
    }
  }

  void setUrl(String newUrl) {
    state = state.copyWith(url: newUrl);
  }

  void setMemo(String newMemo) {
    state = state.copyWith(memo: newMemo);
  }

  void setUid() {
    state = state.copyWith(uid: _userRepository.currentUser.uid);
  }

  bool isValidMenuData() {
    return state.imageFile != null && state.name?.isNotEmpty == true;
  }

  Future<void> addMenuData() async {
    final docId = DateTime.now().millisecondsSinceEpoch.toString();
    _menuRepository.addMenuData(state.copyWith(docId: docId));
  }
}
