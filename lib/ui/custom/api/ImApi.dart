import 'dart:collection';
import 'package:dufubase/request/ApiClient.dart';
import 'package:dufubase/request/Result.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ChatStatusInfo.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ListenerVo.dart';
class ImApi{
  static String loadChatStatusInfoPath="usergroup/im/commen/checkChatInfo";
  static String loadListenerInfoPath =  "usergroup/listener/getlistenerinfo";


  static Future<Result<ChatStatusInfo>> checkChatInfo(int remoteUid) {
    Map<String, Object> param = HashMap();
    param['remoteUid']=remoteUid;
    return ApiClient.instance.get<ChatStatusInfo>(
        loadChatStatusInfoPath,
        queryParameters: param,
            (json) => ChatStatusInfo.fromJson(json),
        misList: false);
  }
  static Future<Result<ListenerVo> > getListenerInfo(int remoteUid){
    Map<String, Object> param = HashMap();
    param['targetUid']=remoteUid;
    return ApiClient.instance.get<ListenerVo>(
        loadListenerInfoPath,
        queryParameters: param,
            (json) => ListenerVo.fromJson(json),
        misList: false);
  }
}