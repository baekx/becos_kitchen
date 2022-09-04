import 'package:becos_kitchen/model/created_at_field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  const MenuModel._();
  const factory MenuModel({
    @Default('') String name,
    @Default(0) int rateBaek,
    @Default(0) int rateAkane,
    @Default('') String image,
    @Default([]) List<String> tag,
    @Default('') String url,
    @Default('') String memo,
    @CreatedAtField() DateTime? createdAt,
    @Default('') String uid,
    @Default('') String docId,
  }) = _MenuModel;

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);

  int getHigherRate() {
    if (rateBaek >= rateAkane) {
      return rateBaek;
    } else {
      return rateAkane;
    }
  }
}
