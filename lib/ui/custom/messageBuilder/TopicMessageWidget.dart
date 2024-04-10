import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:dufubase/eventbus/EventBusSingleton.dart';
import 'package:dufubase/eventbus/SendMsgEvent.dart';
import 'package:dufubase/eventbus/UpdateImMessageEvent.dart';

import 'package:dufubase/router/RouteHandler.dart';
import 'package:dufubase/util/MDateUtils.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/controller/tim_uikit_chat_controller.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/GiveOrderMessge.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/OrderNotifyMessage.dart';

import '../message/InviteOrderMessge.dart';
import '../message/TopicMessge.dart';

/**
 * TencentImSDKPlugin.v2TIMManager.getMessageManager().insertC2CMessageToLocalStorage(data: "", userID: "", sender: "");
 * 咨询话题选择
 */
class TopicMessageWidget extends StatefulWidget {
  V2TimMessage message;

  TopicMessageWidget(this.message);

  @override
  State<StatefulWidget> createState() {
    return TopicMessageState(message);
  }
}

class TopicMessageState extends State<TopicMessageWidget> {
  V2TimMessage message;
  TopicMessge? topicMessge;

  TopicMessageState(this.message) {
    String customData = message!.customElem!.data!;
    topicMessge = TopicMessge.fromJson(jsonDecode(customData));
  }

  @override
  Widget build(BuildContext context) {
    return getWidget(topicMessge);

    //return TIMUIKitCustomElem(message: message);
  }

  doAction() {}

  Widget getWidget(TopicMessge? topicMessge) {
    return Container(
      child: Container(
        height: 122,
        padding: EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "可选择您要咨询/倾诉的话题",
                style: TextStyle(color: Colors.black54),
              ),
              margin: EdgeInsets.only(left: 4, top: 8),
            ),
            SizedBox(
              height: 8,
            ),
            Wrap(
              direction: Axis.horizontal,
              //排列方向，默认水平方向排列
              alignment: WrapAlignment.start,
              //子控件在主轴上的对齐方式
              spacing: 6.0,
              //主轴上子控件中间的间距
              runAlignment: WrapAlignment.start,
              //子控件在交叉轴上的对齐方式
              runSpacing: 6.0,
              //交叉轴上子控件之间的间距

              children: createItems(context, topicMessge),
            )
          ],
        ),
      ),
      padding: EdgeInsets.only(left: 22, right: 22, bottom: 26),
    );
  }
  createItems(BuildContext context, TopicMessge? topicMessge) {
    List<Widget> widgets = [];
    double screenWidth = (MediaQuery.of(context).size.width - 76 - 60-18 ) / 3;

    for (var value in topicMessge!.serviceTags) {
      widgets.add(GestureDetector(
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          padding: EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 7),
          child: Center(
            child: Text(
              value.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        onTap: () {
          SendMsgEvent msg = SendMsgEvent();
          if (value.name == "其他") {
            msg.data = '你好';
          } else {
            msg.data = '你好,我想聊一聊关于"' + value.name + '"的问题';
          }
          msg.msgType = MessageElemType.V2TIM_ELEM_TYPE_TEXT;
          EventBusSingleton.getInstance().fire(msg);

          TencentImSDKPlugin.v2TIMManager
              .getMessageManager().deleteMessageFromLocalStorage( msgID:message.msgID! );


            EventBusSingleton.getInstance().fire(UpdateImMessageEvent(message.msgID!));




        },
      ));
    }
    return widgets;
  }

}

