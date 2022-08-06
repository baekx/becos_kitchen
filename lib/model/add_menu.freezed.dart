// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddMenu {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get rate => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;
  List<String> get tag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddMenuCopyWith<AddMenu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMenuCopyWith<$Res> {
  factory $AddMenuCopyWith(AddMenu value, $Res Function(AddMenu) then) =
      _$AddMenuCopyWithImpl<$Res>;
  $Res call(
      {String? id, String? name, int? rate, File? imageFile, List<String> tag});
}

/// @nodoc
class _$AddMenuCopyWithImpl<$Res> implements $AddMenuCopyWith<$Res> {
  _$AddMenuCopyWithImpl(this._value, this._then);

  final AddMenu _value;
  // ignore: unused_field
  final $Res Function(AddMenu) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rate = freezed,
    Object? imageFile = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_AddMenuCopyWith<$Res> implements $AddMenuCopyWith<$Res> {
  factory _$$_AddMenuCopyWith(
          _$_AddMenu value, $Res Function(_$_AddMenu) then) =
      __$$_AddMenuCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id, String? name, int? rate, File? imageFile, List<String> tag});
}

/// @nodoc
class __$$_AddMenuCopyWithImpl<$Res> extends _$AddMenuCopyWithImpl<$Res>
    implements _$$_AddMenuCopyWith<$Res> {
  __$$_AddMenuCopyWithImpl(_$_AddMenu _value, $Res Function(_$_AddMenu) _then)
      : super(_value, (v) => _then(v as _$_AddMenu));

  @override
  _$_AddMenu get _value => super._value as _$_AddMenu;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? rate = freezed,
    Object? imageFile = freezed,
    Object? tag = freezed,
  }) {
    return _then(_$_AddMenu(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      tag: tag == freezed
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_AddMenu implements _AddMenu {
  const _$_AddMenu(
      {this.id,
      this.name,
      this.rate,
      this.imageFile,
      final List<String> tag = const []})
      : _tag = tag;

  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? rate;
  @override
  final File? imageFile;
  final List<String> _tag;
  @override
  @JsonKey()
  List<String> get tag {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  @override
  String toString() {
    return 'AddMenu(id: $id, name: $name, rate: $rate, imageFile: $imageFile, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddMenu &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile) &&
            const DeepCollectionEquality().equals(other._tag, _tag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(imageFile),
      const DeepCollectionEquality().hash(_tag));

  @JsonKey(ignore: true)
  @override
  _$$_AddMenuCopyWith<_$_AddMenu> get copyWith =>
      __$$_AddMenuCopyWithImpl<_$_AddMenu>(this, _$identity);
}

abstract class _AddMenu implements AddMenu {
  const factory _AddMenu(
      {final String? id,
      final String? name,
      final int? rate,
      final File? imageFile,
      final List<String> tag}) = _$_AddMenu;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  int? get rate => throw _privateConstructorUsedError;
  @override
  File? get imageFile => throw _privateConstructorUsedError;
  @override
  List<String> get tag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AddMenuCopyWith<_$_AddMenu> get copyWith =>
      throw _privateConstructorUsedError;
}
