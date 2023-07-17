import 'package:json_annotation/json_annotation.dart';

import '../constants/MyMessageElemType.dart';

part 'RemindMessage.g.dart';
@JsonSerializable()
class RemindMessage{
  String? content;
  String? actionContent;
  String? actionColor;
  String? color;
  String? bgColor;
  String? action;
  int subCustomType=MyMessageElemType.CUSTOM_MESSAGE_TYPE_REMIND;

  RemindMessage(this.content, this.actionContent, this.actionColor, this.color,
      this.bgColor, this.action);
  factory RemindMessage.fromJson(Map<String, dynamic> json) =>
      _$RemindMessageFromJson(json);

  Map<String, dynamic> toJson() => _$RemindMessageToJson(this);
}