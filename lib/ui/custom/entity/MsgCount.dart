import 'package:json_annotation/json_annotation.dart';

part 'MsgCount.g.dart';
@JsonSerializable()
class MsgCount{
 @JsonKey(defaultValue: 0)
 int id;
 @JsonKey(defaultValue: 0)

 int selfUid;
 @JsonKey(defaultValue: 0)

 int remoteUid;
 @JsonKey(defaultValue: "")
 String day;
 @JsonKey(defaultValue: 0)

 int count;
  //1 每日赠送 2 下单赠送
 @JsonKey(defaultValue: 0)

 int type;
  MsgCount(this.id,this.selfUid, this.remoteUid, this.day, this.count, this.type);
 factory MsgCount.fromJson(Map<String, dynamic> json) =>
     _$MsgCountFromJson(json);

 Map<String, dynamic> toJson() => _$MsgCountToJson(this);
}