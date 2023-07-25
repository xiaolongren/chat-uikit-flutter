import 'package:json_annotation/json_annotation.dart';

part 'FreeMsgCount.g.dart';
@JsonSerializable()
class FreeMsgCount{
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
 FreeMsgCount(this.id,this.selfUid, this.remoteUid, this.day, this.count, this.type);
 factory FreeMsgCount.fromJson(Map<String, dynamic> json) =>
     _$FreeMsgCountFromJson(json);

 Map<String, dynamic> toJson() => _$FreeMsgCountToJson(this);
}