import 'dart:async';

import 'package:dufubase/request/Result.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/api/ImApi.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/api/MsgCountApi.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ChatStatusInfo.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ListenerVo.dart';

class CustomImController {
  static String tag = "CustomImController";
  String? remoteImId; //
  String? imId;
  int remoteUid = 0;
  int uid=0;
  ListenerVo? listenerVo;

  //聊天状态信息,进入聊天页面时 要初始化为null，切记
  static ChatStatusInfo? chatStatusInfo;

  CustomImController(this.remoteImId){
    loadImId();
  }
 static cosumeMSgCount() async {
    //不在同一个订单中并且对方是倾听者，我方发送消息就要扣除免费条数。
    if (CustomImController.chatStatusInfo != null &&
        CustomImController.chatStatusInfo!.isRemoteListener&&!CustomImController.chatStatusInfo!.isInSameOrder&& !CustomImController.chatStatusInfo!.isRemoteCustomerService&& !CustomImController.chatStatusInfo!.isCustomerService) {
      MsgCountApi.consume(CustomImController.chatStatusInfo!.uid, CustomImController.chatStatusInfo!.remoteUid);
    }

    //   widget.model.sendCustomMessage(data: json.encode(RemindMessage("还有1分钟文字订单即将结束", "立即开启", "#4169E", "#696969", "#D3D3D3", "http://baidu.com").toJson()), convID: widget.conversationID, convType: ConvType.c2c);

  }
  Future<Result<ChatStatusInfo>> checkChatInfo() {
    if (remoteUid == 0) {
      remoteUid = parseRemoteUid();
    }
    return ImApi.checkChatInfo(remoteUid);
  }

  Future<Result<ListenerVo>> loadListenerInfo() async {
    if (remoteUid == 0) {
      remoteUid = parseRemoteUid();
    }
    Completer<Result<ListenerVo>> completer = Completer<Result<ListenerVo>>();

    await ImApi.getListenerInfo(remoteUid).then((value) => {
          if (value.errorCode == 0)
            {listenerVo = value.data, completer.complete(value)}
        });
    return completer.future;
  }

  parseRemoteUid() {
    if (remoteImId != null) {
      if (remoteImId!.contains("huanxindev")) {
        return int.parse(remoteImId!.replaceAll("huanxindev", ""));
      }
      if (remoteImId!.contains("huanxin")) {
        return int.parse(remoteImId!.replaceAll("huanxin", ""));
      }
      return int.parse(remoteImId!);
    }
  }
  parseUid(){
    if (imId != null) {
      if (imId!.contains("huanxindev")) {
        return int.parse(imId!.replaceAll("huanxindev", ""));
      }
      if (imId!.contains("huanxin")) {
        return int.parse(imId!.replaceAll("huanxin", ""));
      }
      return int.parse(imId!);
    }
  }
   loadImId() async {

     V2TimValueCallback<String> getLoginUserRes =     await TencentImSDKPlugin.v2TIMManager.getLoginUser();
     if (getLoginUserRes.code == 0) {
       //获取成功
       imId= getLoginUserRes.data; // getLoginUserRes.data为查询到的登录用户的UserID

     }
     uid=parseUid();
   }

  /**
   * 发送邀请下单消息
   */
   sendPlaceOrderMsg() async {
     if(uid==0){
      await loadImId();
      ImApi.onFreeMessagesDepleted(uid, remoteUid );

     }else{
       ImApi.onFreeMessagesDepleted(uid, remoteUid );

     }

   }
  String getcertificateName(ListenerVo listenerVo){

    if(listenerVo.certificateName==""){
      return "倾听师";
    }
    return listenerVo.certificateName.toString();
  }
}
