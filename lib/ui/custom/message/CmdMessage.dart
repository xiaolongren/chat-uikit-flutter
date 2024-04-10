import 'dart:collection';
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/constants/MyMessageElemType.dart';

part 'CmdMessage.g.dart';
@JsonSerializable()
class CmdMessage{
  /**
   * data：{
   *    type:1// 1 剩余时间不足语音提醒
   *    roomId://当 type=1时有用
   * }
   */
  String data;
  @JsonKey(includeFromJson: false,includeToJson: false)
  Map<String ,dynamic> datamap=HashMap();
  parseData(){
    datamap=jsonDecode(data);
    return datamap;
  }




  int subCustomType=MyMessageElemType.CUSTOM_MESSAGE_TYPE_CMD;

  CmdMessage(this.data, this.subCustomType);
  factory CmdMessage.fromJson(Map<String, dynamic> json) =>
      _$CmdMessageFromJson(json);

  Map<String, dynamic> toJson() => _$CmdMessageToJson(this);
}