// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Menu _$$_MenuFromJson(Map<String, dynamic> json) => _$_Menu(
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      rate: json['rate'] as int? ?? 1,
      image: json['image'] as String?,
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$_MenuToJson(_$_Menu instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rate': instance.rate,
      'image': instance.image,
      'tag': instance.tag,
    };
