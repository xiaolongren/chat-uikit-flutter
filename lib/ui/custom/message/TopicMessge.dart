import 'package:json_annotation/json_annotation.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ServiceTag.dart';

/**
 * 赠送免费订单消息
 */
part 'TopicMessge.g.dart';
@JsonSerializable()
class TopicMessge{

    List<ServiceTag> serviceTags;
    int subCustomType;

    TopicMessge(this.serviceTags,this.subCustomType);
    factory TopicMessge.fromJson(Map<String, dynamic> json) =>
        _$TopicMessgeFromJson(json);

    Map<String, dynamic> toJson() => _$TopicMessgeToJson(this);
}