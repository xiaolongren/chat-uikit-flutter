import 'package:json_annotation/json_annotation.dart';

/**
 * 赠送免费订单消息
 */
part 'InviteOrderMessge.g.dart';
@JsonSerializable()
class InviteOrderMessge{



    @JsonKey(defaultValue: 990)
    int amount;
    @JsonKey(defaultValue: 0)
    int itemSpecSnapshotId;
    @JsonKey(defaultValue: "")
    String title;
    @JsonKey(defaultValue: 0)
    int itemId;
    @JsonKey(defaultValue: 0)
    int createTime;
    @JsonKey(defaultValue: "getInviteOrder")
    String action;//路由动作

    @JsonKey(defaultValue: "语音通话")
    String serviceType;
    @JsonKey(defaultValue: 900)
    int duration;
    @JsonKey(defaultValue: 0)
    int sellerId;
    InviteOrderMessge(
      this.amount,
      this.itemSpecSnapshotId,
      this.title,
      this.itemId,
      this.createTime,
      this.action,
      this.serviceType,
      this.duration,
        this.sellerId);
    factory InviteOrderMessge.fromJson(Map<String, dynamic> json) =>
        _$InviteOrderMessgeFromJson(json);

    Map<String, dynamic> toJson() => _$InviteOrderMessgeToJson(this);


}