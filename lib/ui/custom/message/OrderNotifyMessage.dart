import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/constants/MyMessageElemType.dart';

part 'OrderNotifyMessage.g.dart';
@JsonSerializable()
class OrderNotifyMessage{
  @JsonKey(defaultValue: "")
  String? content;
  @JsonKey(defaultValue: "")
  String? title;
  @JsonKey(defaultValue: "")
  String? action;
  int subCustomType=MyMessageElemType.CUSTOM_ORDER_NOTIFY;

  OrderNotifyMessage(this.content, this.title, this.action);


  factory OrderNotifyMessage.fromJson(Map<String, dynamic> json) =>
      _$OrderNotifyMessageFromJson(json);

  Map<String, dynamic> toJson() => _$OrderNotifyMessageToJson(this);
}