import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState({
    required String title,
    required int score,
  }) = _MenuState;

  factory MenuState.fromJson(Map<String, dynamic> json) =>
      _$MenuStateFromJson(json);
}
