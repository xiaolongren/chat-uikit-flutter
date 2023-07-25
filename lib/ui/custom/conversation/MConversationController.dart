import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/controller/tim_uikit_conversation_controller.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/constants/CustomConversationId.dart';

class MConversationController extends TIMUIKitConversationController{

  //初始化 运营消息会话，插入会话列表头部
  void initOperateConverSation(){
    Future.delayed(Duration(seconds: 5),(){
      V2TimConversation sysmsg=V2TimConversation(conversationID: CustomConversationId.SYS_MSG,orderkey: 1,type:ConversationType.V2TIM_C2C);
      V2TimConversation interactionmsg=V2TimConversation(conversationID: CustomConversationId.INTERACTION_MSG,orderkey: 0,type:ConversationType.V2TIM_C2C);
      conversationList.add(interactionmsg);
      conversationList.add( sysmsg);
      model.notifyListeners();
    });


}

}