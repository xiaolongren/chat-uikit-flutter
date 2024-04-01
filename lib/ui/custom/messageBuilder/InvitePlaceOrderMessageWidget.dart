import 'dart:convert';

import 'package:bruno/bruno.dart';

import 'package:dufubase/router/RouteHandler.dart';
import 'package:dufubase/util/MDateUtils.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/GiveOrderMessge.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/OrderNotifyMessage.dart';

import '../message/InviteOrderMessge.dart';

class InvitePlaceOrderMessageWidget extends StatefulWidget {
  V2TimMessage message;

  InvitePlaceOrderMessageWidget(this.message);

  @override
  State<StatefulWidget> createState() {
    return InvitePlaceOrderMessageState(message);
  }
}

class InvitePlaceOrderMessageState
    extends State<InvitePlaceOrderMessageWidget> {
  V2TimMessage message;
  InviteOrderMessge? inviteOrderMessge;

  InvitePlaceOrderMessageState(this.message) {
    String customData = message!.customElem!.data!;
    inviteOrderMessge = InviteOrderMessge.fromJson(jsonDecode(customData));
  }

  @override
  Widget build(BuildContext context) {
    return getWidget(inviteOrderMessge);

    //return TIMUIKitCustomElem(message: message);
  }

  doAction() {
    if (inviteOrderMessge!.action != null) {
      print("action:" + inviteOrderMessge!.action);

      RouteHandler.handle(inviteOrderMessge!.action!);
    }
  }

  Widget getWidget(InviteOrderMessge? inviteOrderMessge) {
    String title =
        "邀您" + (inviteOrderMessge?.serviceType == "voice" ? "语音通话" : "文字沟通");
    // int endTime=double.parse((giveOrderMessge.createTime/1000).toString()).toInt()+giveOrderMessge.withinTimeValidity  ;

    // String timeTitle=DateTime.now().millisecondsSinceEpoch/1000<endTime?(giveOrderMessge.withinTimeValidity/3600) .toString()+"小时内领取有效":"已失效";
    //  String timeTitle=(inviteOrderMessge.withinTimeValidity/3600) .toString()+"小时内领取有效";
    return SizedBox(
      width: 160,
      height: 70,
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.only(left: (message?.isSelf==true?4:12),top: 4,right: message?.isSelf==true?12:4,bottom: 4), // 内边距为6
          decoration: BoxDecoration(
            color: Colors.orange, // 背景色为电商橙色
            borderRadius: BorderRadius.circular(6.0), // 圆角半径为10
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: message!.isSelf==true?CrossAxisAlignment.end:CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Text("" + ((inviteOrderMessge?.amount ?? 0) / 100.0).toString()+"金豆"+" " +
                  ((inviteOrderMessge?.duration ?? 0) / 60.0).toString() +
                  "分钟",
                  style: TextStyle(color: Colors.white, fontSize: 11)),
              SizedBox(height: 6),
              Container(color: Colors.white38,height: 0.3,width: double.infinity,),
              SizedBox(height: 2),

              Row(
                mainAxisAlignment: message.isSelf==true?MainAxisAlignment.start:MainAxisAlignment.end,
                children: [Text("邀请下单",style: TextStyle(fontSize: 10,color: Colors.white60),)],)
              // Text(
              //     "时长：" +
              //         ((inviteOrderMessge?.duration ?? 0) / 60.0).toString() +
              //         "分钟",
              //     style: TextStyle(color: Colors.white, fontSize: 12))
            ],
          ),
        ),
        onTap: () {
          if (inviteOrderMessge!.action != null &&
              inviteOrderMessge!.action!.length > 0&&message.isSelf==false) {
            doAction();
          }
        },
      ),
    );
  }
}
