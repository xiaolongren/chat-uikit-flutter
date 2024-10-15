import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/message/calling_message/single_call_message_builder.dart';

import 'calling_message.dart';
import 'group_call_message_builder.dart';

class CallingMessageBulder{
 static Widget? build(V2TimMessage message){
   // if(message.isSelf!=null){
   //   message.isSelf=!message.isSelf!;
   // }
      final callingMessage = CallingMessage.getCallMessage(message.customElem);
      if (callingMessage != null) {
        if (message.groupID != null) {
          // Group Call message
          return GroupCallMessageItem(customMessage: message);
        } else {
          // One-to-one Call message
          return renderMessageItem(
            CallMessageItem(
                customElem: message.customElem,
                isFromSelf:  message.isSelf ?? true,
                padding: const EdgeInsets.all(0)),
            message,
            CommonColor.defaultTheme,
            false,
          );
        }
      }else{
        return null;
      }

    }

  static Widget renderMessageItem(Widget child, V2TimMessage message,TUITheme theme, bool isVoteMessage) {
    final isFromSelf = message.isSelf ?? true;
    final borderRadius = isFromSelf
        ? const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(2),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10))
        : const BorderRadius.only(
        topLeft: Radius.circular(2),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10));

    final defaultStyle = isFromSelf
        ? theme.lightPrimaryMaterialColor.shade50
        : theme.weakBackgroundColor;
    final backgroundColor =
        defaultStyle  ;

    return Container(
        padding: isVoteMessage
            ? null
            : (  const EdgeInsets.all(10)),
        decoration: isVoteMessage
            ? BoxDecoration(
            border: Border.all(
                width: 1, color: theme.weakDividerColor ?? Colors.grey))
            : BoxDecoration(
          color:  backgroundColor,
          borderRadius:   borderRadius,
        ),
        constraints: BoxConstraints(
            maxWidth:
            isVoteMessage ? 298 : 240), // vote message width need more
        child: child);
  }
  //拒绝通话 特殊处理 反转
 static isFromSelf(CallingMessage callingMessage,V2TimMessage message){
   if(callingMessage.actionType==4){
     bool res=message.isSelf??true;
      return !res;
   }
   return message.isSelf;
  }

}