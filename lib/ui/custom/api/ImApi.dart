import 'dart:collection';
import 'package:dufubase/request/ApiClient.dart';
import 'package:dufubase/request/Result.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ChatStatusInfo.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ImOrder.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ListenerVo.dart';
class ImApi{
  static String loadChatStatusInfoPath="usergroup/im/commen/checkChatInfo";
  static String loadListenerInfoPath =  "usergroup/listener/getlistenerinfo";
  static String onOpenp2pChatPath =  "usergroup/listener/onOpenp2pChat";
  static String onFreeMessagesDepletedPath =  "usergroup/listener/onFreeMessagesDepleted";


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
  static Future<Result<int>> onOpenp2pChat(int fromUid,int toUid){

    Map<String, Object> param = HashMap();
    param['fromUid']=fromUid;
    param['toUid']=toUid;
    return ApiClient.instance.get<int>(
        onOpenp2pChatPath,
        queryParameters: param,
            (json) => Result.fromJsonInt(json),
        misList: false);
  }
  static int parseUid(String imId){
       if (imId!= null) {
        if (imId!.contains("huanxindev")) {
          return int.parse(imId!.replaceAll("huanxindev", ""));
        }
        if (imId!.contains("huanxin")) {
          return int.parse(imId!.replaceAll("huanxin", ""));
        }
        return int.parse(imId!);
      }
       return 0;

  }

  /**
   * 免费条数用完时发送
   */
  static Future<Result<int>> onFreeMessagesDepleted(int fromUid,int toUid){

    Map<String, Object> param = HashMap();
    param['fromUid']=fromUid;
    param['toUid']=toUid;
    return ApiClient.instance.get<int>(
        onFreeMessagesDepletedPath,
        queryParameters: param,
            (json) => Result.fromJsonInt(json),
        misList: false);
  }
  static Future<Result<int>> preChat(String remoteImid){
    int remoteUid=  ImApi.parseUid(remoteImid);
    return  preChatByUid(remoteUid);

  }
  static Future<Result<int>> preChatByUid(int remoteUid){
    String preChat="usergroup/im/commen/preChat";
    Map<String, Object> param = HashMap();
    param['remoteUid'] = remoteUid;
    return ApiClient.instance.get<int>(
        preChat,
        queryParameters: param,
            (item) => Result.fromJsonInt(item));

  }

}