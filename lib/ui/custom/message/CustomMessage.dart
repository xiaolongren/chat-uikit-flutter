import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/constants/MyMessageElemType.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/messageBuilder/DefaultCustomMessageWidget.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/messageBuilder/RemindMessageWidget.dart';

class CustomMessageRender {


  static Widget render(V2TimMessage message){
    try{
      int   type= jsonDecode( message.customElem!.data!)["subCustomType"];

      if(type==MyMessageElemType.CUSTOM_MESSAGE_TYPE_REMIND){
        return RemindMessageWidget(message);
      }
      return DefaultCustomMessageWidget();
    }catch(e){
      return DefaultCustomMessageWidget();

    };

  }
}