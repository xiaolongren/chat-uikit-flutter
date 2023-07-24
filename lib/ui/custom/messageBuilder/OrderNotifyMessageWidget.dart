import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:dufubase/actionhandler/ActionHandler.dart';
import 'package:dufubase/actionhandler/ActionHandlerManager.dart';
import 'package:dufubase/router/RouteHandler.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/OrderNotifyMessage.dart';

class OrderNotifyMessageWidget extends StatefulWidget {
  V2TimMessage message;

  OrderNotifyMessageWidget(this.message);

  @override
  State<StatefulWidget> createState() {
    return OrderNotifyMessageState(message);
  }
}

class OrderNotifyMessageState extends State<OrderNotifyMessageWidget> {
  V2TimMessage message;
  OrderNotifyMessage? orderNotifyMessage;

  OrderNotifyMessageState(this.message) {
    String customData = message!.customElem!.data!;
    orderNotifyMessage = OrderNotifyMessage.fromJson(jsonDecode(customData));
  }

  @override
  Widget build(BuildContext context) {
    return getWidget(orderNotifyMessage);

    //return TIMUIKitCustomElem(message: message);
  }

  doAction() {
    if (orderNotifyMessage!.action != null) {
      if (orderNotifyMessage!.action!.startsWith("dufu://")) {
        RouteHandler.handle(orderNotifyMessage!.action!);
      } else if (orderNotifyMessage!.action!.trim().length > 0 &&
          orderNotifyMessage!.action!.startsWith("method")) {
        Uri uri = Uri.parse(Uri.decodeFull(orderNotifyMessage!.action!));

        ActionHandler? actionHandler =
            ActionHandlerManager.getHandler(uri.path);
        if (actionHandler != null) {
          actionHandler.handle(uri.path, uri.queryParameters);
        }
      }
    }
  }

  Widget getWidget(OrderNotifyMessage? orderNotifyMessage) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.only(top: 12, left: 16, bottom: 12, right: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 243, 243, 243), blurRadius: 9)
              ]),
          child: IntrinsicHeight(
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                Container(
                    child: Text(orderNotifyMessage!.title! + "",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(orderNotifyMessage!.content! + "",
                        style:
                            TextStyle(fontSize: 14, color: Colors.grey[600]))),
                if (orderNotifyMessage.action != null &&
                    orderNotifyMessage.action!.length > 0)
                  Container(
                      height: 30,
                      child: Row(
                        children: [
                          Text("查看详情",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.lightBlue)),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color.fromARGB(255, 187, 188, 191),
                          )
                        ],
                      ))
              ])))),
      onTap: () {
        if (orderNotifyMessage.action != null &&
            orderNotifyMessage.action!.length > 0) {
          doAction();
        }
      },
    );
  }
}
