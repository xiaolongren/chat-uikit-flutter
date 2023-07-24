// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListenerVo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListenerVo _$ListenerVoFromJson(Map<String, dynamic> json) => ListenerVo(
      json['nick'] as String? ?? '',
      json['headUrl'] as String? ?? '',
      (json['serviceTags'] as List<dynamic>?)
              ?.map((e) => ServiceTag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      json['age'] as int? ?? 0,
      json['gender'] as int? ?? 0,
      json['birthDay'] as int? ?? 0,
      json['listenerId'] as int? ?? 0,
      json['education'] as String? ?? '',
      json['marriageStatus'] as String? ?? '',
      json['uid'] as int? ?? 0,
      json['minPrice'] as int? ?? 0,
      json['work'] as String? ?? '',
      json['introduce'] as String? ?? '',
      json['serviceSeconds'] as int? ?? 0,
      (json['goodRate'] as num?)?.toDouble() ?? 0,
      json['message'] as String? ?? '',
      json['serviceUserCount'] as int? ?? 0,
      json['commentNums'] as int? ?? 0,
    );

Map<String, dynamic> _$ListenerVoToJson(ListenerVo instance) =>
    <String, dynamic>{
      'nick': instance.nick,
      'headUrl': instance.headUrl,
      'serviceTags': instance.serviceTags,
      'age': instance.age,
      'gender': instance.gender,
      'birthDay': instance.birthDay,
      'listenerId': instance.listenerId,
      'education': instance.education,
      'marriageStatus': instance.marriageStatus,
      'uid': instance.uid,
      'minPrice': instance.minPrice,
      'work': instance.work,
      'introduce': instance.introduce,
      'serviceSeconds': instance.serviceSeconds,
      'goodRate': instance.goodRate,
      'serviceUserCount': instance.serviceUserCount,
      'commentNums': instance.commentNums,
      'message': instance.message,
    };
