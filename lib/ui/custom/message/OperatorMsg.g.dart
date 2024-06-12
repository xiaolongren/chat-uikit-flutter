// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OperatorMsg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperatorMsg _$OperatorMsgFromJson(Map<String, dynamic> json) => OperatorMsg(
      json['title'] as String,
      json['descr'] as String,
      (json['subCustomType'] as num).toInt(),
    );

Map<String, dynamic> _$OperatorMsgToJson(OperatorMsg instance) =>
    <String, dynamic>{
      'title': instance.title,
      'descr': instance.descr,
      'subCustomType': instance.subCustomType,
    };
