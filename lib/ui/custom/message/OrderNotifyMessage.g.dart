// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderNotifyMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderNotifyMessage _$OrderNotifyMessageFromJson(Map<String, dynamic> json) =>
    OrderNotifyMessage(
      json['content'] as String? ?? '',
      json['title'] as String? ?? '',
      json['action'] as String? ?? '',
    );

Map<String, dynamic> _$OrderNotifyMessageToJson(OrderNotifyMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'title': instance.title,
      'action': instance.action,
    };
