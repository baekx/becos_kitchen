import 'dart:io';

import 'package:becos_kitchen/di/repository_provider.dart';
import 'package:becos_kitchen/model/add_menu_state.dart';
import 'package:becos_kitchen/repository/menu_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../screen/add_menu/menu_tag_list.dart';

final addMenuViewModelProvider =
    StateNotifierProvider.autoDispose<AddMenuViewModel, AddMenuState>(
        (ref) => AddMenuViewModel(ref.read(menuRepositoryProvider)));

class AddMenuViewModel extends StateNotifier<AddMenuState> {
  AddMenuViewModel(this._menuRepository)
      : super(AddMenuState(
            name: '',
            tag: [],
            rate: 3,
            createdAt: DateTime.now(),
            url: '',
            memo: ''));

  final MenuRepository _menuRepository;

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
    state = state.copyWith(rate: newScore);
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

  bool isValidMenuData() {
    return state.imageFile != null && state.name?.isNotEmpty == true;
  }

  Future<void> addMenuData() async {
    _menuRepository.addMenuData(state);
  }
}
