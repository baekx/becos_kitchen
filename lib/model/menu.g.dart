// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Menu _$$_MenuFromJson(Map<String, dynamic> json) => _$_Menu(
      name: json['name'] as String,
      rate: json['rate'] as int,
      image: json['image'] as String,
      tag: (json['tag'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_MenuToJson(_$_Menu instance) => <String, dynamic>{
      'name': instance.name,
      'rate': instance.rate,
      'image': instance.image,
      'tag': instance.tag,
    };
