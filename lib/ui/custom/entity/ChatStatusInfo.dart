
import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ImOrder.dart';
part 'ChatStatusInfo.g.dart';
@JsonSerializable()
class ChatStatusInfo {
    @JsonKey(defaultValue: 0)
    int remoteUid;
  //我方uid
    @JsonKey(defaultValue: 0)

    int uid;
    @JsonKey(defaultValue: false)
    bool isRemoteListener;
  //我方是否是倾听者
    @JsonKey(defaultValue: false)
    bool isListener;
  //我方的在线状态
    @JsonKey(defaultValue: 1)
    int onlineStatus;
  //我方的在线状态标题
    @JsonKey(defaultValue: "在线")
    String onlineStatusTitle;
    @JsonKey(defaultValue: 1)
    int remoteUserOnlineStatus;
    @JsonKey(defaultValue: "在线")
    String remoteUserOnlineStatusTitle;
  //是否在同一个订单
    @JsonKey(defaultValue: true)
    bool isInSameOrder;
    @JsonKey(defaultValue: 0)
    int endTime;
    @JsonKey(defaultValue: true)
    bool voiceCallOrderEnable;
    @JsonKey(defaultValue: false)
    bool videoCallOrderEnable;
    @JsonKey(defaultValue: false)
    bool isRemoteCustomerService;
    @JsonKey(defaultValue: false)
    bool isCustomerService;
    @JsonKey(defaultValue: "")
    String remoteNick;
    @JsonKey(defaultValue: 0)
    int canShowFree;
  //双方正在使用的同一个订单
    @JsonKey(defaultValue: null)
    ImOrder? order;
    @JsonKey(defaultValue: 0)
    int leftFeeMsgcount;

    ChatStatusInfo(
        this.leftFeeMsgcount,
      this.remoteUid,
      this.uid,
      this.isRemoteListener,
      this.isListener,
      this.onlineStatus,
      this.onlineStatusTitle,
      this.remoteUserOnlineStatus,
      this.remoteUserOnlineStatusTitle,
      this.isInSameOrder,
      this.endTime,
      this.voiceCallOrderEnable,
        this.videoCallOrderEnable,
        this.isRemoteCustomerService,
      this.isCustomerService,
      this.order,
        this.remoteNick,this.canShowFree);
    factory ChatStatusInfo.fromJson(Map<String, dynamic> json) =>
        _$ChatStatusInfoFromJson(json);

    Map<String, dynamic> toJson() => _$ChatStatusInfoToJson(this);
}
