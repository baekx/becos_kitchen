import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_menu_state.freezed.dart';

@freezed
class AddMenuState with _$AddMenuState {
  const factory AddMenuState({
    String? id,
    String? name,
    int? rateAkane,
    int? rateBaek,
    File? imageFile,
    @Default([]) List<String> tag,
    DateTime? createdAt,
    String? url,
    String? memo,
    String? uid,
    String? docId,
  }) = _AddMenuState;
}
