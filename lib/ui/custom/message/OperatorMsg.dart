import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/constants/MyMessageElemType.dart';

part 'OperatorMsg.g.dart';
@JsonSerializable()
class OperatorMsg{
  String title;
  String descr;
  int subCustomType=MyMessageElemType.CUSTOM_MESSAGE_TYPE_OPERATOR;

  OperatorMsg(this.title, this.descr, this.subCustomType);

  factory OperatorMsg.fromJson(Map<String, dynamic> json) =>
      _$OperatorMsgFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorMsgToJson(this);
}