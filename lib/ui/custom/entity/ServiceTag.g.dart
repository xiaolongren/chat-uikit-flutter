// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServiceTag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTag _$ServiceTagFromJson(Map<String, dynamic> json) => ServiceTag(
      json['id'] as num? ?? 0,
      json['name'] as String? ?? '',
      json['isGroup'] as num? ?? 0,
      json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$ServiceTagToJson(ServiceTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isGroup': instance.isGroup,
      'icon': instance.icon,
    };
