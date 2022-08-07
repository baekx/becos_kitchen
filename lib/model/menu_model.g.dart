// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuModel _$$_MenuModelFromJson(Map<String, dynamic> json) => _$_MenuModel(
      name: json['name'] as String? ?? '',
      rate: json['rate'] as int? ?? 0,
      image: json['image'] as String? ?? '',
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      url: json['url'] as String? ?? '',
      memo: json['memo'] as String? ?? '',
    );

Map<String, dynamic> _$$_MenuModelToJson(_$_MenuModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rate': instance.rate,
      'image': instance.image,
      'tag': instance.tag,
      'url': instance.url,
      'memo': instance.memo,
    };
