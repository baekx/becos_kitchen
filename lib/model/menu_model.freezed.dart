// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) {
  return _MenuModel.fromJson(json);
}

/// @nodoc
mixin _$MenuModel {
  String get name => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<String> get tag => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuModelCopyWith<MenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuModelCopyWith<$Res> {
  factory $MenuModelCopyWith(MenuModel value, $Res Function(MenuModel) then) =
      _$MenuModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int rate,
      String image,
      List<String> tag,
      String url,
      String memo});
}

/// @nodoc
class _$MenuModelCopyWithImpl<$Res> implements $MenuModelCopyWith<$Res> {
  _$MenuModelCopyWithImpl(this._value, this._then);

  final MenuModel _value;
  // ignore: unused_field
  final $Res Function(MenuModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? rate = freezed,
    Object? image = freezed,
    Object? tag = freezed,
    Object? url = freezed,
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MenuModelCopyWith<$Res> implements $MenuModelCopyWith<$Res> {
  factory _$$_MenuModelCopyWith(
          _$_MenuModel value, $Res Function(_$_MenuModel) then) =
      __$$_MenuModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int rate,
      String image,
      List<String> tag,
      String url,
      String memo});
}

/// @nodoc
class __$$_MenuModelCopyWithImpl<$Res> extends _$MenuModelCopyWithImpl<$Res>
    implements _$$_MenuModelCopyWith<$Res> {
  __$$_MenuModelCopyWithImpl(
      _$_MenuModel _value, $Res Function(_$_MenuModel) _then)
      : super(_value, (v) => _then(v as _$_MenuModel));

  @override
  _$_MenuModel get _value => super._value as _$_MenuModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? rate = freezed,
    Object? image = freezed,
    Object? tag = freezed,
    Object? url = freezed,
    Object? memo = freezed,
  }) {
    return _then(_$_MenuModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      tag: tag == freezed
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuModel implements _MenuModel {
  const _$_MenuModel(
      {this.name = '',
      this.rate = 0,
      this.image = '',
      final List<String> tag = const [],
      this.url = '',
      this.memo = ''})
      : _tag = tag;

  factory _$_MenuModel.fromJson(Map<String, dynamic> json) =>
      _$$_MenuModelFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int rate;
  @override
  @JsonKey()
  final String image;
  final List<String> _tag;
  @override
  @JsonKey()
  List<String> get tag {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String memo;

  @override
  String toString() {
    return 'MenuModel(name: $name, rate: $rate, image: $image, tag: $tag, url: $url, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other._tag, _tag) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.memo, memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(_tag),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(memo));

  @JsonKey(ignore: true)
  @override
  _$$_MenuModelCopyWith<_$_MenuModel> get copyWith =>
      __$$_MenuModelCopyWithImpl<_$_MenuModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuModelToJson(this);
  }
}

abstract class _MenuModel implements MenuModel {
  const factory _MenuModel(
      {final String name,
      final int rate,
      final String image,
      final List<String> tag,
      final String url,
      final String memo}) = _$_MenuModel;

  factory _MenuModel.fromJson(Map<String, dynamic> json) =
      _$_MenuModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get rate => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  List<String> get tag => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get memo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MenuModelCopyWith<_$_MenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}
