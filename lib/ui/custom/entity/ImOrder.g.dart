// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImOrder _$ImOrderFromJson(Map<String, dynamic> json) => ImOrder(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['sellerId'] as num).toInt(),
      (json['buyerId'] as num).toInt(),
      (json['updateTime'] as num).toInt(),
      (json['leftTime'] as num).toInt(),
      (json['totalTime'] as num).toInt(),
      (json['createTime'] as num).toInt(),
      (json['payTime'] as num).toInt(),
    );

Map<String, dynamic> _$ImOrderToJson(ImOrder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sellerId': instance.sellerId,
      'buyerId': instance.buyerId,
      'updateTime': instance.updateTime,
      'leftTime': instance.leftTime,
      'totalTime': instance.totalTime,
      'createTime': instance.createTime,
      'payTime': instance.payTime,
    };
