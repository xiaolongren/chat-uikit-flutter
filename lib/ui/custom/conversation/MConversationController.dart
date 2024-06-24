import 'dart:convert';

import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/controller/tim_uikit_conversation_controller.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/constants/CustomConversationId.dart';

import '../entity/ConversationCustomData.dart';

class MConversationController extends TIMUIKitConversationController {
  //初始化 运营消息会话，插入会话列表头部
  void initOperateConverSation() {
    Future.delayed(Duration(seconds: 5), () {
      V2TimConversation sysmsg = V2TimConversation(
          conversationID: CustomConversationId.SYS_MSG,
          orderkey: 1,
          type: ConversationType.V2TIM_C2C);
      V2TimConversation interactionmsg = V2TimConversation(
          conversationID: CustomConversationId.INTERACTION_MSG,
          orderkey: 0,
          type: ConversationType.V2TIM_C2C);
      conversationList.add(interactionmsg);
      conversationList.add(sysmsg);
      model.notifyListeners();
    });
  }

 static String? parseNoteNick(String customData){
    if(customData!=null&&customData!=""){
      try{
        ConversationCustomData conversationCustomData=ConversationCustomData.fromJson(jsonDecode(customData));
        return conversationCustomData.noteNick??null;
      }catch(e){
        return null;
      }
    }
  }
  static Future<void> updateNoteNick(String targetimId,String nick) async {
    String conversationId = "c2c_" + targetimId;

    V2TimValueCallback<V2TimConversation> restconv = await TencentImSDKPlugin
        .v2TIMManager
        .getConversationManager()
        .getConversation(conversationID: conversationId);
    String customData = "";
    if (restconv != null && restconv.data != null) {
      customData = restconv.data!.customData ?? "";
    }
    ConversationCustomData? conversationCustomData;
    if (customData == "") {
      conversationCustomData=ConversationCustomData(nick);
      customData=jsonEncode(conversationCustomData.toJson());
    }else{

      conversationCustomData=ConversationCustomData.fromJson(jsonDecode(customData));
      conversationCustomData.noteNick=nick;
      customData=jsonEncode(conversationCustomData.toJson());

    }
//设置会话自定义消息
    V2TimValueCallback<List<V2TimConversationOperationResult>>
        setConversationCustomDataRes = await TencentImSDKPlugin.v2TIMManager
            .getConversationManager()
            .setConversationCustomData(
                customData: customData, // 设置的自定义消息
                conversationIDList: [conversationId]); // 需要设置自定义消息的会话id列表
    if (setConversationCustomDataRes.code == 0) {
      // 设置成功
      setConversationCustomDataRes.data?.forEach((element) {
        element.conversationID; //被设置的会话id
        element.resultCode; //此条会话的请求结果错误码
        element.resultInfo; //此条会话的请求结果描述
      });
    }
  }
}
