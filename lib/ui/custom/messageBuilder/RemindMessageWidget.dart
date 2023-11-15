import 'dart:convert';

import 'package:dufubase/router/RouteHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dufubase/util/ColorUtils.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/RemindMessage.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitChat/TIMUIKitMessageItem/tim_uikit_chat_custom_elem.dart';

import '../../../tencent_cloud_chat_uikit.dart';

class RemindMessageWidget extends StatefulWidget {
  V2TimMessage message;

  RemindMessageWidget(this.message);

  @override
  State<StatefulWidget> createState() {
    return RemindMessageState(message);
  }
}

class RemindMessageState extends State<RemindMessageWidget> {
  V2TimMessage message;
  RemindMessage? remindMessage;

  RemindMessageState(this.message) {
    String customData = message!.customElem!.data!;
    remindMessage = RemindMessage.fromJson(jsonDecode(customData));
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(

        child: ClipRRect(



         // borderRadius: BorderRadius.circular(20),
          child: Container(
               color: getBgColor(),
              padding: EdgeInsets.only(top: 4,bottom: 4,left: 4,right: 4),

              alignment: Alignment.center,
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: TIM_t(remindMessage!.content!),
                  style: TextStyle(color: getColor()),
                ),
                if (remindMessage?.actionContent != null)
                  TextSpan(
                    text: TIM_t(" " + (remindMessage?.actionContent ?? "")),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        doAction();
                      },
                    style: TextStyle(color: getActionColor()),
                  )
              ], style: const TextStyle(fontSize: 12))))),margin: EdgeInsets.only(top: 12,bottom: 12),);

    //return TIMUIKitCustomElem(message: message);
  }

  getActionColor() {
    try {
      return remindMessage!.actionColor == null
          ? Colors.lightBlue
          : ColorUtils.hexToColor(remindMessage!.actionColor!);
    } catch (e) {
      print(e);
      return Colors.transparent;
    }
  }

  getColor() {
    try {
      return remindMessage!.color == null
          ? Colors.black
          : ColorUtils.hexToColor(remindMessage!.color!);
    } catch (e) {
      print(e);
      return Colors.transparent;
    }
  }

  getBgColor() {
    try {
      return remindMessage!.bgColor == null
          ?Colors.transparent
          : ColorUtils.hexToColor(remindMessage!.bgColor!);
    } catch (e) {
      print(e);
      return Colors.transparent;
    }
  }

  doAction() {
    if (remindMessage!.action != null) {
      if (remindMessage!.action!.startsWith("dufu://")) {
        RouteHandler.handle(remindMessage!.action!);
      }
    }
  }
}
