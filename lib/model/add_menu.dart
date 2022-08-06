import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_menu.freezed.dart';

@freezed
class AddMenu with _$AddMenu {
  const factory AddMenu(
      {String? id,
      String? name,
      int? rate,
      File? imageFile,
      @Default([]) List<String> tag}) = _AddMenu;
}
