import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/RemindMessage.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitChat/TIMUIKitMessageItem/tim_uikit_chat_custom_elem.dart';

import '../../../tencent_cloud_chat_uikit.dart';

class RemindMessageWidget extends StatefulWidget {
  V2TimMessage message;
  RemindMessageWidget( this.message);

  @override
  State<StatefulWidget> createState() {
    return RemindMessageState(message);
  }

}
class RemindMessageState extends State<RemindMessageWidget>{
  V2TimMessage message;
  RemindMessage? remindMessage;
  RemindMessageState(this.message){
   String customData=  message!.customElem!.data!;
   remindMessage=RemindMessage.fromJson(jsonDecode(customData));
  }
  @override
  Widget build(BuildContext context) {
    return Container(

        color: getBgColor(),
        margin: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text.rich(TextSpan(children: [
          TextSpan(
            text: TIM_t(remindMessage!.content!),
            style: TextStyle(color:  getColor()),
          ),
          if(remindMessage?.actionContent!=null)
          TextSpan(
            text: TIM_t(remindMessage?.actionContent??""),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
            doAction();

              },
            style: TextStyle(color:  getActionColor()),
          )
        ], style: const TextStyle(fontSize: 12))));


    //return TIMUIKitCustomElem(message: message);
  }

  getActionColor(){
   return remindMessage!.actionColor==null?Colors.lightBlue: int.parse(remindMessage!.actionColor!.replaceFirst('#', '0xff'));
  }
  getColor(){
    return remindMessage!.color==null?Colors.black: int.parse(remindMessage!.color!.replaceFirst('#', '0xff'));

  }
  getBgColor(){
    return remindMessage!.bgColor==null?Colors.transparent: int.parse(remindMessage!.bgColor!.replaceFirst('#', '0xff'));

  }
  doAction(){
    if(remindMessage.action!=null){
       if(remindMessage.action.startsWith("dufu://")){

       }

    }
  }

}