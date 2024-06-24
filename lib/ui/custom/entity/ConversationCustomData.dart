import 'package:json_annotation/json_annotation.dart';

/**
 *会话自定义数据
 */
part 'ConversationCustomData.g.dart';
@JsonSerializable()
class ConversationCustomData{

  //备注名称
  String? noteNick;

  ConversationCustomData(this.noteNick);
  factory ConversationCustomData.fromJson(Map<String, dynamic> json) =>
      _$ConversationCustomDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationCustomDataToJson(this);
}