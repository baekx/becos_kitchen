// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuModel _$$_MenuModelFromJson(Map<String, dynamic> json) => _$_MenuModel(
      name: json['name'] as String? ?? '',
      rateBaek: json['rateBaek'] as int? ?? 0,
      rateAkane: json['rateAkane'] as int? ?? 0,
      image: json['image'] as String? ?? '',
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      url: json['url'] as String? ?? '',
      memo: json['memo'] as String? ?? '',
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
      uid: json['uid'] as String? ?? '',
    );

Map<String, dynamic> _$$_MenuModelToJson(_$_MenuModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rateBaek': instance.rateBaek,
      'rateAkane': instance.rateAkane,
      'image': instance.image,
      'tag': instance.tag,
      'url': instance.url,
      'memo': instance.memo,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
      'uid': instance.uid,
    };
