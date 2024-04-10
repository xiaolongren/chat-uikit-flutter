import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/constants/MyMessageElemType.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/messageBuilder/GiveOrderMessageWidget.dart';
import '../messageBuilder/InvitePlaceOrderMessageWidget.dart';
import 'calling_message/CallingMessageBuilder.dart';

class CustomMessageRender {
  static Widget? render(V2TimMessage message) {
    int type = 0;
    Map<String, dynamic> map = jsonDecode(message.customElem!.data!);
    if (map.containsKey("subCustomType")) {
      type = map["subCustomType"];
    }
    print("subType:" + type.toString());
    if (type == MyMessageElemType.CUSTOM_MESSAGE_TYPE_GIVEORDER) {
      return GiveOrderMessageWidget(message);
    }
    if (type == MyMessageElemType.CUSTOM_MESSAGE_TYPE_INVITE_PLACEORDER) {
      return InvitePlaceOrderMessageWidget(message);
    }if (type == MyMessageElemType.CUSTOM_MESSAGE_TYPE_TOPIC_SELECT) {
      return null;
    }
    return CallingMessageBulder.build(message);
  }
}
