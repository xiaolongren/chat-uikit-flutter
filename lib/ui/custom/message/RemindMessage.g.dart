// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RemindMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemindMessage _$RemindMessageFromJson(Map<String, dynamic> json) =>
    RemindMessage(
      json['content'] as String?,
      json['actionContent'] as String?,
      json['actionColor'] as String?,
      json['color'] as String?,
      json['bgColor'] as String?,
      json['action'] as String?,
    )..subCustomType = json['subCustomType'] as int;

Map<String, dynamic> _$RemindMessageToJson(RemindMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'actionContent': instance.actionContent,
      'actionColor': instance.actionColor,
      'color': instance.color,
      'bgColor': instance.bgColor,
      'action': instance.action,
      'subCustomType': instance.subCustomType,
    };
