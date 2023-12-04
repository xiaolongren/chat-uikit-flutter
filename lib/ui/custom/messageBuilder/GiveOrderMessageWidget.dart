import 'dart:convert';

import 'package:bruno/bruno.dart';

import 'package:dufubase/router/RouteHandler.dart';
import 'package:dufubase/util/MDateUtils.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/GiveOrderMessge.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/OrderNotifyMessage.dart';

class GiveOrderMessageWidget extends StatefulWidget {
  V2TimMessage message;

GiveOrderMessageWidget(this.message);

  @override
  State<StatefulWidget> createState() {
    return GiveOrderMessageState(message);
  }
}

class GiveOrderMessageState extends State<GiveOrderMessageWidget> {
  V2TimMessage message;
  GiveOrderMessge? giveOrderMessge;

  GiveOrderMessageState(this.message) {
    String customData = message!.customElem!.data!;
    giveOrderMessge = GiveOrderMessge.fromJson(jsonDecode(customData));
  }

  @override
  Widget build(BuildContext context) {
    return getWidget(giveOrderMessge);

    //return TIMUIKitCustomElem(message: message);
  }

  doAction() {
    if (giveOrderMessge!.action != null) {


      print("action:"+giveOrderMessge!.action);

        RouteHandler.handle(giveOrderMessge!.action!);

    }
  }

  Widget getWidget(GiveOrderMessge? giveOrderMessge) {
    String title="送您"+(giveOrderMessge!.duration/60).toString()+"分钟语音通话";
   // int endTime=double.parse((giveOrderMessge.createTime/1000).toString()).toInt()+giveOrderMessge.withinTimeValidity  ;

   // String timeTitle=DateTime.now().millisecondsSinceEpoch/1000<endTime?(giveOrderMessge.withinTimeValidity/3600) .toString()+"小时内领取有效":"已失效";
    String timeTitle=(giveOrderMessge.withinTimeValidity/3600) .toString()+"小时内领取有效";
    return
      SizedBox(width: 180,height: 70,child:  GestureDetector(
        child: Container(
          padding: EdgeInsets.all(6.0), // 内边距为6
          decoration: BoxDecoration(
            color: Colors.orange, // 背景色为电商橙色
            borderRadius: BorderRadius.circular(6.0), // 圆角半径为10
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(
            title,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
            SizedBox(height:12),
            Text(timeTitle, style: TextStyle(color: Colors.white,fontSize: 12))
          ],),
        ),
        onTap: () {
          if (giveOrderMessge!.action != null &&
              giveOrderMessge!.action!.length > 0) {
            doAction();
          }
        },
      ),);

  }
}
