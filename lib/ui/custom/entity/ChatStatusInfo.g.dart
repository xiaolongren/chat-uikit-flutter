// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatStatusInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatStatusInfo _$ChatStatusInfoFromJson(Map<String, dynamic> json) =>
    ChatStatusInfo(
      (json['remoteUid'] as num?)?.toInt() ?? 0,
      (json['uid'] as num?)?.toInt() ?? 0,
      json['isRemoteListener'] as bool? ?? false,
      json['isListener'] as bool? ?? false,
      (json['onlineStatus'] as num?)?.toInt() ?? 1,
      json['onlineStatusTitle'] as String? ?? '在线',
      (json['remoteUserOnlineStatus'] as num?)?.toInt() ?? 1,
      json['remoteUserOnlineStatusTitle'] as String? ?? '在线',
      json['isInSameOrder'] as bool? ?? true,
      (json['endTime'] as num?)?.toInt() ?? 0,
      json['voiceCallOrderEnable'] as bool? ?? true,
      json['videoCallOrderEnable'] as bool? ?? false,
      json['isRemoteCustomerService'] as bool? ?? false,
      json['isCustomerService'] as bool? ?? false,
      json['order'] == null
          ? null
          : ImOrder.fromJson(json['order'] as Map<String, dynamic>),
      json['remoteNick'] as String? ?? '',
      (json['canShowFree'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChatStatusInfoToJson(ChatStatusInfo instance) =>
    <String, dynamic>{
      'remoteUid': instance.remoteUid,
      'uid': instance.uid,
      'isRemoteListener': instance.isRemoteListener,
      'isListener': instance.isListener,
      'onlineStatus': instance.onlineStatus,
      'onlineStatusTitle': instance.onlineStatusTitle,
      'remoteUserOnlineStatus': instance.remoteUserOnlineStatus,
      'remoteUserOnlineStatusTitle': instance.remoteUserOnlineStatusTitle,
      'isInSameOrder': instance.isInSameOrder,
      'endTime': instance.endTime,
      'voiceCallOrderEnable': instance.voiceCallOrderEnable,
      'videoCallOrderEnable': instance.videoCallOrderEnable,
      'isRemoteCustomerService': instance.isRemoteCustomerService,
      'isCustomerService': instance.isCustomerService,
      'remoteNick': instance.remoteNick,
      'canShowFree': instance.canShowFree,
      'order': instance.order,
    };
