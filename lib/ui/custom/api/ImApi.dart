import 'dart:collection';
import 'dart:core';
import 'package:dufubase/db/DBHelper.dart';
import 'package:dufubase/request/ApiClient.dart';
import 'package:dufubase/request/Result.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ChatStatusInfo.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ImOrder.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/ListenerVo.dart';
class ImApi{
  static String loadChatStatusInfoPath="usergroup/im/commen/checkChatInfo";
  static String loadListenerInfoPath =  "usergroup/listener/getlistenerinfo";
  static String updateImStatusPath =  "usergroup/im/online/updateImStatus";
  static String onOpenp2pChatPath =  "usergroup/listener/onOpenp2pChat";
  static String sendBuyNotifPath =  "usergroup/listener/sendBuyNotif";
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
  static Future<Result<int>> updateImStatus(int uid,int status){
    Map<String, Object> param = HashMap();
    param['uid']=uid;
    param['status']=status;
    return ApiClient.instance.get<int>(
        updateImStatusPath,
        queryParameters: param,
            (json) => Result.fromJsonInt(json),
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
  static  void sendBuyNoti(int selfUid,int listenerUid) async {

    List<Map<String, dynamic>> data = await DBHelper.queryData(
        DBHelper.TABLE_DUFU_OPEN_LISTENER_RECORD,
        where: 'selfUid=? and listenerUid=?',
        whereArgs: [selfUid, listenerUid]);
    if(data!=null&&data.length>0){
      return;
    }

    Map<String, Object> param = HashMap();
    param['listenerUid']=listenerUid;

     ApiClient.instance.get<int>(
        sendBuyNotifPath,
        queryParameters: param,
            (json) => Result.fromJsonInt(json),
        misList: false);
     Map<String,dynamic> insertdata=HashMap();
     insertdata["selfUid"]=selfUid;
     insertdata["listenerUid"]=listenerUid;
     DBHelper.insertData(DBHelper.TABLE_DUFU_OPEN_LISTENER_RECORD, insertdata);
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
  static Future<Result<int>> getGiveOrder(int id){
    String preChat="pay/order/getGiveOrder";
    Map<String, Object> param = HashMap();
    param['id'] = id;
    return ApiClient.instance.get<int>(
        preChat,
        queryParameters: param,
            (item) => Result.fromJsonInt(item));
  }


}