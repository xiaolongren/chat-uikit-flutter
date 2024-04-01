import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/messageBuilder/GiveOrderMessageWidget.dart';

import '../constants/MyMessageElemType.dart';
import '../messageBuilder/DefaultCustomMessageWidget.dart';
import '../messageBuilder/OrderNotifyMessageWidget.dart';
import '../messageBuilder/RemindMessageWidget.dart';

class CustomNoAvatarMessageRender{


  static Widget? render(V2TimMessage message){
    try{
      print("eeeeeeeeeeee::type::"+message.customElem!.data!);

      Map<String,dynamic> map=jsonDecode( message.customElem!.data!);
      if(map.containsKey("subCustomType")){
        int   type= map["subCustomType"];
        if(type==MyMessageElemType.CUSTOM_MESSAGE_TYPE_REMIND){
          return RemindMessageWidget(message);
        }
        else if(type==MyMessageElemType.CUSTOM_ORDER_NOTIFY){
          return OrderNotifyMessageWidget(message);
        }
        else if(type==MyMessageElemType.CUSTOM_MESSAGE_TYPE_GIVEORDER){
          return null;
        }
        else if(type==MyMessageElemType.CUSTOM_MESSAGE_TYPE_INVITE_PLACEORDER){
          return null;
        }

        return DefaultCustomMessageWidget();
      }else{
        return null;

      }



    }catch(e){

      print("eeeeeeeeeeee");
      return null;

    }

  }
}