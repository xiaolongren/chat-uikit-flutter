// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MsgCount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgCount _$MsgCountFromJson(Map<String, dynamic> json) => MsgCount(
      json['id'] as int? ?? 0,
      json['selfUid'] as int? ?? 0,
      json['remoteUid'] as int? ?? 0,
      json['day'] as String? ?? '',
      json['count'] as int? ?? 0,
      json['type'] as int? ?? 0,
    );

Map<String, dynamic> _$MsgCountToJson(MsgCount instance) => <String, dynamic>{
      'id': instance.id,
      'selfUid': instance.selfUid,
      'remoteUid': instance.remoteUid,
      'day': instance.day,
      'count': instance.count,
      'type': instance.type,
    };
