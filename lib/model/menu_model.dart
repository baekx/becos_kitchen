import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  const factory MenuModel(
      {@Default('') String name,
      @Default(0) int rate,
      @Default('') String image,
      @Default([]) List<String> tag,
      @Default('') String url,
      @Default('') String memo}) = _MenuModel;

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);
}
