import 'package:json_annotation/json_annotation.dart';

part 'ServiceTag.g.dart';

@JsonSerializable()
class ServiceTag {
  @JsonKey(defaultValue: 0)
  num id = 0;
  @JsonKey(defaultValue: "")
  String name;
  @JsonKey(defaultValue: 0)
  num isGroup = 0;
  @JsonKey(defaultValue: "")
  String icon;

  ServiceTag(this.id, this.name, this.isGroup, this.icon); // 添加 fromJson 工厂方法
  factory ServiceTag.fromJson(Map<String, dynamic> json) =>
      _$ServiceTagFromJson(json);

  // 添加 toJson 方法
  Map<String, dynamic> toJson() => _$ServiceTagToJson(this);
}
