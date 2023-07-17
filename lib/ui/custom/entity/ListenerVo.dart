import 'package:json_annotation/json_annotation.dart';

import 'ServiceTag.dart';
part 'ListenerVo.g.dart';

@JsonSerializable()
class ListenerVo {
  @JsonKey(defaultValue: "")
   String nick;
  @JsonKey(defaultValue: "")
  String headUrl;
  @JsonKey(defaultValue: [])
  List<ServiceTag> serviceTags;
  @JsonKey(defaultValue: 0)
  int age = 0;
  @JsonKey(defaultValue: 0)
  int gender = -1;
  @JsonKey(defaultValue: 0)
  int birthDay = 0;
  @JsonKey(defaultValue: 0)
  int listenerId = 0;
  @JsonKey(defaultValue: "")
  String education;
  @JsonKey(defaultValue: "")
  String marriageStatus;
  @JsonKey(defaultValue: 0)
   int uid;
  @JsonKey(defaultValue: 0)
  int minPrice = 0;
  @JsonKey(defaultValue: "")
  String work;
  @JsonKey(defaultValue: "")
  String introduce;
  @JsonKey(defaultValue: 0)
  int serviceSeconds = 0;
  @JsonKey(defaultValue: 0)
  double goodRate = 0.0;
  @JsonKey(defaultValue: 0)
  int serviceUserCount = 0;
  @JsonKey(defaultValue: 0)
  int commentNums = 0;
  //寄语
  @JsonKey(defaultValue: "")
  String message;

  ListenerVo(
      this.nick,
      this.headUrl,
      this.serviceTags,
      this.age,
      this.gender,
      this.birthDay,
      this.listenerId,
      this.education,
      this.marriageStatus,
      this.uid,
      this.minPrice,
      this.work,
      this.introduce,
      this.serviceSeconds,
      this.goodRate,
      this.message,
      this.serviceUserCount,
      this.commentNums); // 添加 fromJson 工厂方法
  factory ListenerVo.fromJson(Map<String, dynamic> json) => _$ListenerVoFromJson(json);

  // 添加 toJson 方法
  Map<String, dynamic> toJson() => _$ListenerVoToJson(this);


}
