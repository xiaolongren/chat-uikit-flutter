import 'package:json_annotation/json_annotation.dart';

part 'ImOrder.g.dart';
@JsonSerializable()
class ImOrder {

  int id;

  // 订单项
  String name;

  // 总价格
  int totalprice;
  int sellerId;
  int buyerId;


  //是否已评论
  int updateTime;

  //剩余秒数
  int leftTime;
  int totalTime;

  int createTime;
  int payTime;


  ImOrder(
      this.id,
      this.name,
      this.totalprice,
      this.sellerId,
      this.buyerId,

      this.updateTime,
      this.leftTime,
      this.totalTime,
      this.createTime,
      this.payTime
     );
  factory ImOrder.fromJson(Map<String, dynamic> json) =>
      _$ImOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ImOrderToJson(this);

}
