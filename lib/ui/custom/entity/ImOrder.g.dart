// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImOrder _$ImOrderFromJson(Map<String, dynamic> json) => ImOrder(
      json['id'] as int,
      json['name'] as String,
      json['totalprice'] as int,
      json['sellerId'] as int,
      json['buyerId'] as int,
      json['type'] as int,
      json['updateTime'] as int,
      json['leftTime'] as int,
      json['totalTime'] as int,
      json['createTime'] as int,
      json['payTime'] as int,
      json['isFirstOrder'] as int,
    );

Map<String, dynamic> _$ImOrderToJson(ImOrder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalprice': instance.totalprice,
      'sellerId': instance.sellerId,
      'buyerId': instance.buyerId,
      'type': instance.type,
      'updateTime': instance.updateTime,
      'leftTime': instance.leftTime,
      'totalTime': instance.totalTime,
      'createTime': instance.createTime,
      'payTime': instance.payTime,
      'isFirstOrder': instance.isFirstOrder,
    };
