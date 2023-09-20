import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/constants/MyMessageElemType.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/messageBuilder/DefaultCustomMessageWidget.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/messageBuilder/OrderNotifyMessageWidget.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/messageBuilder/RemindMessageWidget.dart';

import 'calling_message/CallingMessageBuilder.dart';
import 'calling_message/calling_message.dart';
import 'calling_message/group_call_message_builder.dart';
import 'calling_message/single_call_message_builder.dart';

class CustomMessageRender {


  static Widget? render(V2TimMessage message){
    Widget? widget=CallingMessageBulder.build(message);

    return widget;





  }

}