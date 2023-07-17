import 'dart:async';

import 'package:dufubase/request/Result.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/api/ImApi.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ChatStatusInfo.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ListenerVo.dart';

class CustomImController {
  static String tag = "CustomImController";
  String? remoteImId; //
  int remoteUid = 0;
  ListenerVo? listenerVo;

  //聊天状态信息,进入聊天页面时 要初始化为null，切记
  static ChatStatusInfo? chatStatusInfo;

  CustomImController(this.remoteImId);

  Future<Result<ChatStatusInfo>> checkChatInfo() {
    if (remoteUid == 0) {
      remoteUid = parseUid();
    }
    return ImApi.checkChatInfo(remoteUid);
  }

  Future<Result<ListenerVo>> loadListenerInfo() async {
    if (remoteUid == 0) {
      remoteUid = parseUid();
    }
    Completer<Result<ListenerVo>> completer = Completer<Result<ListenerVo>>();

    await ImApi.getListenerInfo(remoteUid).then((value) => {
          if (value.errorCode == 0)
            {listenerVo = value.data, completer.complete(value)}
        });
    return completer.future;
  }

  parseUid() {
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
}
