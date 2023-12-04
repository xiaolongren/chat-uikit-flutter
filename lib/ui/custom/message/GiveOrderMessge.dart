import 'package:json_annotation/json_annotation.dart';

/**
 * 赠送免费订单消息
 */
part 'GiveOrderMessge.g.dart';
@JsonSerializable()
class GiveOrderMessge{
    String type;

  /**
   * 单为：秒，最大值900
   */
    int duration;

    int fromUid;

    int toUid;

    int createTime;

  /**
   * 0 待领取 1已领取
   */
    int stauts;

  /**
   * 单位秒 ，多长时间内领取有效
   */
    int withinTimeValidity;
    String action;

    int id;


    GiveOrderMessge(
      this.type,
      this.duration,
      this.fromUid,
      this.toUid,
      this.createTime,
      this.stauts,
      this.withinTimeValidity,
      this.action,
      this.id);

  factory GiveOrderMessge.fromJson(Map<String, dynamic> json) =>
      _$GiveOrderMessgeFromJson(json);

  Map<String, dynamic> toJson() => _$GiveOrderMessgeToJson(this);

}