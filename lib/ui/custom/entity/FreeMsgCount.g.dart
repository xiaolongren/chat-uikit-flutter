// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FreeMsgCount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeMsgCount _$FreeMsgCountFromJson(Map<String, dynamic> json) => FreeMsgCount(
      (json['id'] as num?)?.toInt() ?? 0,
      (json['selfUid'] as num?)?.toInt() ?? 0,
      (json['remoteUid'] as num?)?.toInt() ?? 0,
      json['day'] as String? ?? '',
      (json['count'] as num?)?.toInt() ?? 0,
      (json['type'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FreeMsgCountToJson(FreeMsgCount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selfUid': instance.selfUid,
      'remoteUid': instance.remoteUid,
      'day': instance.day,
      'count': instance.count,
      'type': instance.type,
    };
