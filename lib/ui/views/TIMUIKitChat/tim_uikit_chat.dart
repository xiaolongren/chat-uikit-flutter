// ignore_for_file: must_be_immutable, avoid_print
import 'dart:async';

import 'package:bruno/bruno.dart';
import 'package:dufubase/config/UmengEvent.dart';
import 'package:dufubase/eventbus/CallEvent.dart';
import 'package:dufubase/eventbus/FreeMsgCountEvent.dart';
import 'package:dufubase/eventbus/OnlineStatusEvent.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:dufubase/eventbus/EventBusSingleton.dart';
import 'package:dufubase/eventbus/OrderCountDStartEvent.dart';
import 'package:dufubase/eventbus/OrderStatusChangeEvent.dart';
import 'package:dufubase/eventbus/PlaceOrderEvent.dart';
import 'package:dufubase/eventbus/TxtChatEvent.dart';
import 'package:dufubase/router/ARouter.dart';
import 'package:dufubase/router/constants/RoutingTable.dart';
import 'package:dufubase/util/MDateUtils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:tencent_cloud_chat_uikit/base_widgets/tim_ui_kit_base.dart';
import 'package:tencent_cloud_chat_uikit/base_widgets/tim_ui_kit_state.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/life_cycle/chat_life_cycle.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/listener_model/tui_group_listener_model.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/separate_models/tui_chat_separate_view_model.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/view_models/custom_msg_countleft_model.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/view_models/tui_chat_global_model.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/view_models/tui_conversation_view_model.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/view_models/tui_self_info_view_model.dart';
import 'package:tencent_cloud_chat_uikit/data_services/services_locatar.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/constants/history_message_constant.dart';
import 'package:tencent_cloud_chat_uikit/ui/controller/tim_uikit_chat_controller.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/api/ImApi.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/api/MsgCountApi.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/custom_im_controller.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/frame.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/logger.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/optimize_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/platform.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitChat/TIMUIKitTextField/at_member_panel.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitChat/tim_uikit_multi_select_panel.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitChat/tim_uikit_send_file.dart';
import 'package:tencent_cloud_uikit_core/platform/tuicore_platform_interface.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';
import 'TIMUIKItMessageList/TIMUIKitTongue/tim_uikit_chat_history_message_list_tongue.dart';
import 'TIMUIKItMessageList/tim_uikit_chat_history_message_list_config.dart';
import 'TIMUIKItMessageList/tim_uikit_history_message_list_container.dart';
import 'package:tencent_cloud_chat_uikit/base_widgets/tim_ui_kit_base.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart' as tencent_chat;

class TIMUIKitChat extends StatefulWidget {
  int startTime = 0;
  int endTime = 0;

  /// The chat controller you tend to used.
  /// You have to provide this before using it since tencent_cloud_chat_uikit 0.1.4.
  final TIMUIKitChatController? controller;

  /// [Update] It is suggested to provide the `V2TimConversation` once directly, since tencent_cloud_chat_uikit 1.5.0.
  /// `conversationID` / `conversationType` / `groupAtInfoList` / `conversationShowName` are not necessary to be provided, unless you want to cover these fields manually.
  final V2TimConversation conversation;

  /// The ID of the Group that the topic belongs to, only need for topic.
  final String? groupID;

  /// Conversation id, use for load history message list.
  /// This field is not necessary to be provided, when `conversation` is provided, unless you want to cover this field manually.
  final String? conversationID;

  /// Conversation type.
  /// This field is not necessary to be provided, when `conversation` is provided, unless you want to cover this field manually.
  final ConvType? conversationType;

  /// use for customize avatar
  final Widget Function(BuildContext context, V2TimMessage message)? userAvatarBuilder;

  /// Use for show conversation name.
  /// This field is not necessary to be provided, when `conversation` is provided, unless you want to cover this field manually.
  String? conversationShowName = "";

  /// Avatar and name in message reaction tap callback.
  final void Function(String userID, TapDownDetails tapDetails)? onTapAvatar;

  /// Avatar and name in message reaction secondary tap callback.
  final void Function(String userID, TapDownDetails tapDetails)? onSecondaryTapAvatar;

  @Deprecated("Nickname will not shows in one-to-one chat, if you tend to control it in group chat, please use `isShowSelfNameInGroup` and `isShowOthersNameInGroup` from `config: TIMUIKitChatConfig` instead")

  /// Should show the nick name.
  final bool showNickName;

  /// Message item builder, can customize partial message item for different types or the layout for the whole line.
  final MessageItemBuilder? messageItemBuilder;

  /// Is show unread message count, default value is false
  final bool showTotalUnReadCount;

  /// Deprecated("Please use [extraTipsActionItemBuilder] instead")
  final Widget? Function(V2TimMessage message, Function() closeTooltip, [Key? key, BuildContext? context])? exteraTipsActionItemBuilder;

  /// The builder for extra tips action.
  final Widget? Function(V2TimMessage message, Function() closeTooltip, [Key? key, BuildContext? context])? extraTipsActionItemBuilder;

  /// The text of draft shows in TextField.
  /// [Recommend]: You can specify this field with the draftText from V2TimConversation.
  final String? draftText;

  /// The target message been jumped just after entering the chat page.
  final V2TimMessage? initFindingMsg;

  /// The hint text shows at input field.
  String? textFieldHintText="";

  /// The configuration for appbar.
  final AppBar? appBarConfig;

  /// The configuration for historical message list.
  final TIMUIKitHistoryMessageListConfig? mainHistoryListConfig;

  /// The configuration for more panel, can customize actions.
  final MorePanelConfig? morePanelConfig;

  /// The builder for the tongue on the right bottom.
  /// Used for back to bottom, shows the count of unread new messages,
  /// and prompts the messages that @ user.
  final TongueItemBuilder? tongueItemBuilder;

  /// The `groupAtInfoList` from `V2TimConversation`.
  /// This field is not necessary to be provided, when `conversation` is provided,
  /// unless you want to cover this field manually.
  final List<V2TimGroupAtInfo?>? groupAtInfoList;

  /// The configuration for the whole `TIMUIKitChat` widget.
  final TIMUIKitChatConfig? config;

  /// The callback for jumping to the page for `TIMUIKitGroupApplicationList`
  /// or other pages to deal with enter group application for group administrator manually,
  /// in the case of [public group].
  /// The parameter here is `String groupID`
  final ValueChanged<String>? onDealWithGroupApplication;

  /// The generator for the abstract summary preview of a message,
  /// typically used in replied and forwarded messages.
  /// Returns `null` to use the default message summary.
  final String? Function(V2TimMessage message)? abstractMessageBuilder;

  /// The configuration for tool tips panel, long press messages will show this panel.
  final ToolTipsConfig? toolTipsConfig;

  /// The life cycle for chat business logic.
  final ChatLifeCycle? lifeCycle;

  /// The top fixed widget.
  final Widget? topFixWidget;

  /// Specify the custom small png emoji packages.
  final List<CustomEmojiFaceData> customEmojiStickerList;

  final Widget? customAppBar;

  final Widget? inputTopBuilder;

  /// Custom emoji panel.
  final CustomStickerPanel? customStickerPanel;

  /// This parameter accepts a custom widget to be displayed when the mouse hovers over a message,
  /// replacing the default message hover action bar.
  /// Applicable only on desktop platforms.
  /// If provided, the default message action functionality will appear in the right-click context menu instead.
  /// Returns `null` to use default hover bar.
  final Widget? Function(V2TimMessage message)? customMessageHoverBarOnDesktop;

  /// Custom text field
  final Widget Function(BuildContext context)? textFieldBuilder;

  /// An optional parameter `groupMemberList` can be provided.
  /// `groupMemberList` accepts a list of nullable `V2TimGroupMemberFullInfo` objects.
  /// The purpose of this parameter is to allow the client to supply a pre-fetched list
  /// of group member information. If this list is provided, it will not make
  /// additional network requests to fetch the group member information internally.
  List<V2TimGroupMemberFullInfo?>? groupMemberList;

  TIMUIKitChat(
      {Key? key,
      this.groupID,
      required this.conversation,
      this.conversationID,
      this.conversationType,
      this.groupMemberList,
      this.conversationShowName,
      this.abstractMessageBuilder,
      this.onTapAvatar,
      @Deprecated("Nickname will not show in one-to-one chat, if you tend to control it in group chat, please use `isShowSelfNameInGroup` and `isShowOthersNameInGroup` from `config: TIMUIKitChatConfig` instead") this.showNickName = false,
      this.showTotalUnReadCount = false,
      this.messageItemBuilder,
      @Deprecated("Please use [extraTipsActionItemBuilder] instead") this.exteraTipsActionItemBuilder,
      this.extraTipsActionItemBuilder,
      this.draftText,
      this.textFieldHintText,
      this.initFindingMsg,
      this.userAvatarBuilder,
      this.appBarConfig,
      this.controller,
      this.morePanelConfig,
      this.customStickerPanel,
      this.config = const TIMUIKitChatConfig(),
      this.tongueItemBuilder,
      this.groupAtInfoList,
      this.mainHistoryListConfig,
      this.onDealWithGroupApplication,
      this.toolTipsConfig,
      this.lifeCycle,
      this.topFixWidget = const SizedBox(),
      this.textFieldBuilder,
      this.customEmojiStickerList = const [],
      this.customAppBar,
      this.inputTopBuilder,
      this.onSecondaryTapAvatar,
      this.customMessageHoverBarOnDesktop})
      : super(key: key) {
    startTime = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  State<StatefulWidget> createState() => _TUIChatState();
}

class _TUIChatState extends TIMUIKitState<TIMUIKitChat> {

  CustomImController? customImController;
  StreamSubscription? streamSubscription;
  StreamSubscription? txtOrderFinishStreamSubscription;
  StreamSubscription? orderStatusChangeSubscription;
  TUIChatSeparateViewModel model = TUIChatSeparateViewModel();
  final TUISelfInfoViewModel selfInfoViewModel = serviceLocator<TUISelfInfoViewModel>();
  final TUIThemeViewModel themeViewModel = serviceLocator<TUIThemeViewModel>();
  final TUIConversationViewModel conversationViewModel = serviceLocator<TUIConversationViewModel>();
  TIMUIKitInputTextFieldController textFieldController = TIMUIKitInputTextFieldController();
  bool isInit = false;
  final TUIChatGlobalModel chatGlobalModel = serviceLocator<TUIChatGlobalModel>();
  bool _dragging = false;
  bool showInputDisableView = false;
  final GlobalKey alignKey = GlobalKey();
  final GlobalKey listContainerKey = GlobalKey();

  late AutoScrollController autoController = AutoScrollController(
    viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    axis: Axis.vertical,
  );

  late AutoScrollController atMemberPanelScroll = AutoScrollController(
    viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    axis: Axis.vertical,
  );
  bool showTopinfo = false;
  bool showPlaceOrder = false;
  String textFieldHintText="";


  @override
  void initState() {

    CustomImController.chatStatusInfo = null;
    print("objectinitState");
    if(conversationViewModel.selectedConversation==null||(conversationViewModel.selectedConversation!.conversationID!)!=widget.conversation.conversationID!){
      conversationViewModel.setSelectedConversation(widget.conversation!);
     }

    txtOrderFinishStreamSubscription =
        EventBusSingleton.getInstance().on<TxtChatEvent>().listen((event) {
          WidgetsBinding.instance.addPostFrameCallback((_) {

            if(1==widget.conversation.type){
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  this.textFieldHintText = event.inputHint;
                  if (event.inputHint == null || event.inputHint.length == 0) {
                    MsgCountApi.showMsgCount(
                        customImController!.uid, customImController!.remoteUid);
                  }else{
                    showInputDisableView=false;
                  }
                });
              });
            }



          });

        });
    orderStatusChangeSubscription=EventBusSingleton.getInstance().on<OrderStatusChangeEvent>().listen((event) {
      if(2==conversationViewModel.selectedConversation!.type!){
        return;
      }
     Future.delayed(Duration(seconds: 2),(){
       checkChatInfo();
     });

    });

    streamSubscription =
        EventBusSingleton.getInstance().on<FreeMsgCountEvent>().listen((event) {
          bool shouldChangeState = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (event.count <= 0) {
              customImController!.sendPlaceOrderMsg();
               setState(() {
                showInputDisableView = true;
                this.textFieldHintText =
                    "";
                FocusScope.of(context).requestFocus(FocusNode());
                textFieldController.actionType=tencent_chat.ActionType.hideAllPanel!;
                textFieldController.notifyListeners();

              });
            } else {
             setState(() {
                showInputDisableView = false;
                this.textFieldHintText =
                    "赠送聊天条数剩余" + event.count.toString() + "条";

            });

            }
          });

        });
    // 设置状态栏颜色
    // FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    if (kProfileMode) {
      Frame.init();
    }
    customImController = CustomImController(widget.conversation.userID);


    model.abstractMessageBuilder = widget.abstractMessageBuilder;
    model.onTapAvatar = widget.onTapAvatar;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.endTime = DateTime.now().millisecondsSinceEpoch;
      int timeSpend = widget.endTime - widget.startTime;
      outputLogger.i("Page render time:$timeSpend ms");
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      updateDraft();
    });

    if(1==widget!.conversation!.type!){
      checkChatInfo();

    }
    super.initState();
  }
  @override
  activate(){
    super.activate();
  //  FlutterStatusbarcolor.setStatusBarColor(const Color.fromARGB(255, 243, 243, 243));
    print("生命周期 activate=======");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("生命周期 reassemble=======");

  }
  @override
  deactivate(){
    super.deactivate();
  //  FlutterStatusbarcolor.setStatusBarColor(const Color.fromARGB(255, 237, 237, 237));

  }
  checkChatInfo(){
    customImController!.checkChatInfo().then((mvalue) {
      print("checkChatInfo:"+mvalue.errorCode.toString());
      if (mvalue.errorCode == 0) {

        CustomImController.chatStatusInfo = mvalue.data;
        //双方正在同一个订单服务中
        if(mvalue.data!.isInSameOrder){
          WidgetsBinding.instance.addPostFrameCallback((_) {
            //倒计时开始


            bool isBuyer=customImController!.uid==mvalue.data!.order!.buyerId;
            if(isBuyer){
              OrderCountDStartEvent event = OrderCountDStartEvent(mvalue.data!.order!.id);
              EventBusSingleton.getInstance().fire(event);

            }else{
              setState(() {
                this.textFieldHintText="订单将于"+MDateUtils.caculteShowEndTie(DateTime.now().millisecondsSinceEpoch+mvalue.data!.order!.leftTime*1000)+"结束";

              });
            }
            OnlineStatusEvent onlineStatusEvent = OnlineStatusEvent(
                widget.conversation!.showName!,
                isBuyer? "正在为您服务中":"在线");
            EventBusSingleton.getInstance().fire(onlineStatusEvent);


          });
        }else{
          WidgetsBinding.instance.addPostFrameCallback((_) {
            /**
             * 对方不是倾听者，我方不现实剩余条数
             */
            if(!mvalue.data!.isRemoteListener ){
              setState(() {
                this.textFieldHintText ="";
              });

            }
            //对方是倾听者，我方显示免费条数
            if(mvalue.data!.isRemoteListener&&1==widget.conversation.type){
              MsgCountApi.showMsgCount(
                  mvalue.data!.uid, mvalue.data!.remoteUid);
              OnlineStatusEvent onlineStatusEvent = OnlineStatusEvent(
                  widget.conversation.showName!.isEmpty?mvalue.data!.remoteNick:widget.conversation.showName!,
                  mvalue.data!.remoteUserOnlineStatusTitle!);
              EventBusSingleton.getInstance().fire(onlineStatusEvent);
            }

          });

        }
        if (mvalue.data!.isRemoteListener) {
          customImController!.loadListenerInfo().then((value)
          {
            if(value.errorCode == 0&&value.data!=null){
              showPlaceOrder=true;
              if(value.data!.showTopInfo==1){
                showTopinfo = true;

              }
              setState(() {});


            }

          });
        }

      }
      else{
     //   TUIToast.show(content: mvalue.errorMsg,gravity: TUIGravity.center);

        if(CustomImController.chatStatusInfo==null){
          Navigator.pop(context);
          TUIToast.show(content: mvalue.errorMsg,gravity: TUIGravity.center);
        }


      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (kProfileMode) {
      Frame.destroy();
    }
    if (txtOrderFinishStreamSubscription != null) {
      txtOrderFinishStreamSubscription!.cancel();
      streamSubscription!.cancel();
    }
    if(orderStatusChangeSubscription!=null){
      orderStatusChangeSubscription!.cancel();
      orderStatusChangeSubscription=null;

    }
    CustomImController.chatStatusInfo=null;
    print("chat dispose");
    model.dispose();
  }

  @override
  void didUpdateWidget(TIMUIKitChat oldWidget) {
    super.didUpdateWidget(oldWidget);
   // FlutterStatusbarcolor.setStatusBarColor(const Color.fromARGB(255, 243, 243, 243));

    if (widget.conversationID != oldWidget.conversationID) {
      isInit = false;
      chatGlobalModel.clearCurrentConversation();
      model = TUIChatSeparateViewModel();
      model.abstractMessageBuilder = widget.abstractMessageBuilder;
      model.onTapAvatar = widget.onTapAvatar;
      Future.delayed(const Duration(milliseconds: 50), () {
        updateDraft();
        textFieldController.requestFocus();
        try {
          autoController.jumpTo(
            autoController.position.minScrollExtent,
          );
          autoController.jumpTo(
            autoController.position.minScrollExtent,
          );
          // ignore: empty_catches
        } catch (e) {}
      });
    }
    if (oldWidget.textFieldBuilder != null && widget.textFieldBuilder == null) {
      textFieldController = TIMUIKitInputTextFieldController();
    }
    if (oldWidget.groupMemberList != widget.groupMemberList) {
      model.groupMemberList = widget.groupMemberList;
    }
  }

  updateDraft() async {
    final isTopic = widget.conversation.conversationID.contains("@TOPIC#");
    if (isTopic) {
      final topicInfoList = await TencentImSDKPlugin.v2TIMManager.getGroupManager().getTopicInfoList(groupID: widget.groupID!, topicIDList: [widget.conversation.conversationID]);
      final topicInfo = topicInfoList.data?.first.topicInfo;
      final draftText = topicInfo?.draftText;
      if (TencentUtils.checkString(draftText) != null) {
        textFieldController.setTextField(draftText!);
      }
    }
  }

  Widget _renderJoinGroupApplication(int amount, TUITheme theme) {
    String option1 = amount.toString();
    return Container(
      height: 36,
      decoration: BoxDecoration(color: hexToColor("f6eabc")),
      child: GestureDetector(
        onTap: () {
          if (widget.onDealWithGroupApplication != null) {
            widget.onDealWithGroupApplication!(_getConvID());
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TIM_t_para("{{option1}} 条入群请求", "$option1 条入群请求")(option1: option1),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Text(
                TIM_t("去处理"),
                style: TextStyle(fontSize: 12, color: theme.primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getTitle() {
    return TencentUtils.checkString(widget.conversationShowName) ?? widget.conversation.showName ?? "Chat";
  }

  String _getConvID() {
    return TencentUtils.checkString(widget.conversationID) ?? (widget.conversation.type == 1 ? widget.conversation.userID : widget.conversation.groupID) ?? "";
  }

  ConvType _getConvType() {
    return widget.conversation.type == 1 ? ConvType.c2c : ConvType.group;
  }

  createBottomActionWidget(){
    return
      Container( color:Colors.transparent,padding:EdgeInsets.only(left: 16),child: Row(children: [
        // GestureDetector(onTap: (){
        //   CallEvent callEvent=CallEvent(ImApi.parseUid(conversationViewModel.selectedConversation!.userID.toString()), "video");
        //   EventBusSingleton.getInstance().fire(callEvent);
        //
        // },child:  Container(child:Icon( Icons.videocam_outlined) ,padding:EdgeInsets.only(left: 8,right: 8,top: 1,bottom: 1),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),),),

            SizedBox(width: 16,),

        GestureDetector(onTap: (){
          CallEvent callEvent=CallEvent(ImApi.parseUid(conversationViewModel.selectedConversation!.userID.toString()), "voice");
          EventBusSingleton.getInstance().fire(callEvent);
          UmengCommonSdk.onEvent(UmengEvent.clickCallIcon,{});


        },child:   Container(child:Icon( Icons.call_end_outlined) ,padding:EdgeInsets.only(left: 8,right: 8,top: 1,bottom: 1),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),),
            ),




           ],),);

  }
  @override
  Widget tuiBuild(BuildContext context, TUIKitBuildValue value) {

    final TUITheme theme = value.theme;
    final closePanel = OptimizeUtils.throttle((_) => textFieldController.hideAllPanel(), 60);
    final isBuild = isInit;
    isInit = true;


    return TIMUIKitChatProviderScope(
        model: model,
        groupID: widget.groupID,
        scrollController: autoController,
        textFieldController: textFieldController,
        conversationID: _getConvID(),
        groupMemberList: widget.groupMemberList,
        conversationType: _getConvType(),
        lifeCycle: widget.lifeCycle,
        config: widget.config,
        isBuild: isBuild,
        providers: [
          Provider(create: (_) => widget.config),
        ],
        builder: (context, model, w) {
          final TUIChatGlobalModel chatGlobalModel = Provider.of<TUIChatGlobalModel>(context, listen: true);

          widget.controller?.model = model;
          widget.controller?.textFieldController = textFieldController;
          widget.controller?.scrollController = autoController;
          List<V2TimGroupApplication> filteredApplicationList = [];
          if (widget.conversationType == ConvType.group && widget.onDealWithGroupApplication != null) {
            filteredApplicationList = chatGlobalModel.groupApplicationList.where((item) {
              return (item.groupID == widget.conversationID) && item.handleStatus == 0;
            }).toList();
          }

          final selfUserID = selfInfoViewModel.loginInfo?.userID;
          final TUIGroupListenerModel groupListenerModel = Provider.of<TUIGroupListenerModel>(context, listen: true);
          final NeedUpdate? needUpdate = groupListenerModel.needUpdate;
          if (needUpdate != null && needUpdate.groupID == widget.conversationID) {
            groupListenerModel.needUpdate = null;
            switch (needUpdate.updateType) {
              case UpdateType.groupInfo:
                model.loadGroupInfo(_getConvID());
                break;
              case UpdateType.memberList:
                if (widget.groupMemberList == null) {
                  model.loadGroupMemberList(groupID: _getConvID());
                }
                model.loadGroupInfo(_getConvID());
                break;
              default:
                break;
            }
          }

          List<CustomEmojiFaceData> customImageSmallPngEmojiPackages = [];
          if (widget.config?.stickerPanelConfig?.customStickerPackages != null && widget.config!.stickerPanelConfig!.customStickerPackages.isNotEmpty) {
            customImageSmallPngEmojiPackages = widget.config!.stickerPanelConfig!.customStickerPackages.where((element) => element.isEmoji == true).map((e) {
              return CustomEmojiFaceData(name: e.name, isEmoji: true, icon: e.menuItem.url ?? "", list: e.stickerList.map((e) => e.url ?? "").toList());
            }).toList();
          }
          if (customImageSmallPngEmojiPackages.isEmpty) {
            customImageSmallPngEmojiPackages.addAll(widget.customEmojiStickerList);
          }
          // 获取底部安全区的边距信息
          EdgeInsets padding = MediaQuery.of(context).padding;

          // 计算底部安全区的坐标
          double bottomSafeArea = padding.bottom;

          return GestureDetector(
            onTap: () {
              textFieldController.hideAllPanel();
            },
            child: Scaffold(

                 backgroundColor: theme.chatBgColor,
                resizeToAvoidBottomInset: false,
                appBar: (widget.customAppBar == null&&1==widget.conversation.type)
                    ? TIMUIKitAppBar(
                        showTotalUnReadCount: widget.showTotalUnReadCount,
                        config: widget.appBarConfig,
                        conversationShowName: _getTitle(),
                        conversationID: _getConvID(),
                        showC2cMessageEditStatus: widget.config?.showC2cMessageEditStatus ?? true,
                      )
                    : null,
                body: DropTarget(
                  onDragDone: (detail) {
                    setState(() {
                      _dragging = false;
                      sendFileWithConfirmation(files: detail.files, conversation: widget.conversation, conversationType: _getConvType(), model: model, theme: theme, context: context);
                    });
                  },
                  onDragEntered: (detail) {
                    setState(() {
                      _dragging = true;
                    });
                  },
                  onDragExited: (detail) {
                    setState(() {
                      _dragging = false;
                    });
                  },
                  child: Stack(



                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.customAppBar != null) widget.customAppBar!,
                          //头部倾听师的相关信息
                          if(showTopinfo)
                            Container(
                              color:Color.fromARGB(255, 243, 243, 243),
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 16,),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //  头像
                                  ExtendedImage.network(
                                    customImController!.listenerVo!.headUrl,
                                    // item.user.avatar??"",
                                    width: 50,
                                    height: 50,
                                    shape: BoxShape.circle,
                                    loadStateChanged: (state) {
                                      if (state.extendedImageLoadState ==
                                          LoadState.completed) {
                                        return ExtendedRawImage(
                                          image: state.extendedImageInfo?.image,
                                          fit: BoxFit.cover,
                                        );
                                      } else {
                                        return Container(
                                          color:
                                          Color.fromARGB(255, 230, 230, 230),
                                        );
                                      }
                                    },
                                  ),
                                  SizedBox(width: 8,),

                                  Container(width: 0.5,
                                      height: 68,
                                      color: Color.fromARGB(
                                          255, 230, 230, 230)),
                                  Expanded(child: Column(

                                    children: [
                                      SizedBox(height: 4,),

                                      Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Row(

                                          children: [
                                            Flexible(
                                                flex: 1,
                                                child: Container(
                                                    child: Column(
                                                      children: [
                                                        Text("" +
                                                            customImController!
                                                                .listenerVo!
                                                                .serviceUserCount
                                                                .toString()),
                                                        SizedBox(height: 3,),
                                                        Text(
                                                          "倾诉人次",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Color(
                                                                  0xFF9E9E9E)),
                                                        ),
                                                      ],
                                                    ))),
                                            Expanded(child: SizedBox()),
                                            Flexible(
                                                flex:2,
                                                child: Container(
                                                    child: Column(
                                                      children: [
                                                        Text((customImController!
                                                        .listenerVo!
                                                        .serviceSeconds/3600.0)
                                                            .toString()+"小时"),
                                                        SizedBox(height: 3,),
                                                        Text(
                                                          "服务时长",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Color(
                                                                  0xFF9E9E9E)),
                                                        ),
                                                      ],
                                                    ))),
                                            Expanded(child: SizedBox()),
                                            Flexible(
                                                flex: 1,
                                                child: Container(
                                                    child: Column(
                                                      children: [
                                                        Text(customImController!
                                                            .listenerVo!
                                                            .goodRate
                                                            .toString()),
                                                        SizedBox(height: 3,),
                                                        Text(
                                                          "好评率",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Color(
                                                                  0xFF9E9E9E)),
                                                        ),
                                                      ],
                                                    ))),

                                          ],
                                        ),
                                        width: double.infinity,),

                                      SizedBox(height: 6),
                                      Divider(height: 1,
                                        color: Color.fromARGB(
                                            255, 230, 230, 230),),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(

                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: [
                                          GestureDetector(child: Text("评价(" +
                                              customImController!.listenerVo!
                                                  .commentNums.toString() + ")",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 65, 222, 148),
                                                fontSize: 12),),onTap: (){
                                            ARouter(RoutingTable.listenerCommentsPage).addParam("targetUid", customImController!.listenerVo!.uid.toString()).push();
                                            UmengCommonSdk.onEvent(UmengEvent.clickListenerCommnet,{});

                                          },)
                                          ,
                                          SizedBox(width: 16,)
                                        ],),
                                      SizedBox(height: 4,),

                                    ],
                                  ),),

                                ],
                              ),

                             ),
                          if (filteredApplicationList.isNotEmpty)
                            _renderJoinGroupApplication(
                                filteredApplicationList.length, theme),
                          if (widget.topFixWidget != null) widget.topFixWidget!,
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 8),

                                color: theme.chatBgColor,
                            child: Align(
                                key: alignKey,
                                alignment: Alignment.topCenter,
                                child: Listener(
                                  onPointerMove: closePanel,
                                  child: TIMUIKitHistoryMessageListContainer(
                                    customMessageHoverBarOnDesktop: widget.customMessageHoverBarOnDesktop,
                                    conversation: widget.conversation,
                                    groupMemberInfo: model.groupMemberList?.firstWhere((element) => element?.userID == selfUserID, orElse: () => null),
                                    textFieldController: textFieldController,
                                    customEmojiStickerList: widget.customEmojiStickerList,
                                    isUseDefaultEmoji: widget.config!.isUseDefaultEmoji,
                                    key: listContainerKey,
                                    isAllowScroll: true,
                                    userAvatarBuilder: widget.userAvatarBuilder,
                                    toolTipsConfig: widget.toolTipsConfig,
                                    groupAtInfoList: widget.groupAtInfoList,
                                    tongueItemBuilder: widget.tongueItemBuilder,
                                    onLongPressForOthersHeadPortrait: (String? userId, String? nickName) {
                                      textFieldController.longPressToAt(nickName, userId);
                                    },
                                    mainHistoryListConfig: widget.mainHistoryListConfig,
                                    initFindingMsg: widget.initFindingMsg,
                                    extraTipsActionItemBuilder: widget.extraTipsActionItemBuilder ?? widget.exteraTipsActionItemBuilder,
                                    conversationType: _getConvType(),
                                    scrollController: autoController,
                                    onSecondaryTapAvatar: widget.onSecondaryTapAvatar,
                                    onTapAvatar: widget.onTapAvatar,
                                    // ignore: deprecated_member_use_from_same_package
                                    showNickName: widget.showNickName,
                                    messageItemBuilder: widget.messageItemBuilder,
                                    conversationID: _getConvID(),
                                  ),
                                )),
                          )),
                          widget.inputTopBuilder ?? Container(),
                          Selector<TUIChatSeparateViewModel, bool>(
                            builder: (context, value, child) {
                              return value
                                  ? MultiSelectPanel(
                                      conversationType: _getConvType(),
                                    )
                                  : (widget.textFieldBuilder != null
                                  ? widget.textFieldBuilder!(context)
                                  : getTextFiledView());
                            },
                            selector: (c, model) {
                              return model.isMultiSelect;
                            },
                          )
                        ],
                      ),
                      //头部下单入口
                      if(showPlaceOrder)
                        Positioned(
                          child: GestureDetector(child: Container(
                            padding: EdgeInsets.only(left: 6,right: 6,top: 4,bottom: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange,

                              borderRadius: BorderRadius.circular(20), // 圆角半径
                            ),
                            child: Text("立即下单",style: TextStyle(color: Colors.white,fontSize: 12),

                          ),),onTap: (){
                            UmengCommonSdk.onEvent(UmengEvent.clickPlaceOrder,{});
                            int openFastCall=1;
                            if(customImController?.listenerVo!=null){
                              openFastCall= customImController!.listenerVo!.openFastCall;
                            }


                            EventBusSingleton.getInstance().fire(

                                PlaceOrderEvent(int.parse(
                                    widget.conversation.conversationID!.replaceAll("c2c_huanxin", "")),openFastCall));

                          },),
                          right: 16,
                          top: showTopinfo?80:20,
                        ),





                        // Positioned(
                        //   child:
                        //   Container(child: BrnNormalButton(
                        //     text: "立即下单",
                        //     fontSize: 12,
                        //     backgroundColor: Colors.orange,
                        //     textColor: Colors.white,
                        //     radius: 16,
                        //     onTap: () {
                        //       EventBusSingleton.getInstance().fire(
                        //           PlaceOrderEvent(int.parse(
                        //               widget.conversation.conversationID!
                        //                   .replaceAll("c2c_huanxin", ""))));
                        //     },), height: 30,)
                        //   ,
                        //   right: 16,
                        //   top: 80,
                        // ),

                      if(showInputDisableView)
                        Positioned(
                          child: Container(child: Center(child: Text(
                              "免费条数已用完了"),),
                            width: double.infinity,
                            height: 60,
                            color: Colors.white,),
                          right: 0,
                          left: 0,
                          bottom: bottomSafeArea,
                          height: 60,),


                      if (_dragging)
                        TIMUIKitSendFile(
                          conversation: widget.conversation,
                        ),
                      AtMemberPanel(
                        atMemberPanelScroll: atMemberPanelScroll,
                        onSelectMember: (member) =>
                            textFieldController.handleAtMember(member),
                      )
                    ],
                  ),
                )),

          );
        });
  }

  Widget getTextFiledView() {
    if (widget.config!.onlyShowMessage!) {
      return SizedBox();
    }
    Widget inputwidget= Container( child: Column(children: [

      if(CustomImController.chatStatusInfo?.isCustomerService==false&&CustomImController.chatStatusInfo?.isRemoteCustomerService==false)
      createBottomActionWidget(),SizedBox(height: 8,),
      Container( child:Divider(height: 1,color:Color.fromARGB(255, 230, 230, 230)),),
      TIMUIKitInputTextField(
      groupID: widget.groupID,
      atMemberPanelScroll:
      atMemberPanelScroll,
      backgroundColor: Color.fromARGB(255, 246, 246, 246),//ColorHelpers.bottom_bg
      groupType:
      widget.conversation.groupType,
      currentConversation:
      widget.conversation,
      model: model,
      controller: textFieldController,
      customEmojiStickerList:
      widget.customEmojiStickerList,
      isUseDefaultEmoji:
      widget.config!.isUseDefaultEmoji,
      customStickerPanel:
      widget.customStickerPanel,
      morePanelConfig:
      widget.morePanelConfig,
      scrollController: autoController,
      conversationID: _getConvID(),
      conversationType: _getConvType(),
      initText: TencentUtils.checkString(
          widget.draftText) ??
          (PlatformUtils().isWeb
              ? TencentUtils.checkString(
              conversationViewModel
                  .getWebDraft(
                  conversationID: widget
                      .conversation
                      .conversationID))
              : TencentUtils.checkString(
              widget.conversation
                  .draftText)),
      hintText:  this.textFieldHintText,
      showMorePanel: widget.config
          ?.isAllowShowMorePanel ??
          true,
      showSendAudio: widget.config
          ?.isAllowSoundMessage ??
          true,
      showSendEmoji: widget
          .config?.isAllowEmojiPanel ??
          true,
    )],),);

      return inputwidget;

  }

}

class TIMUIKitChatProviderScope extends StatelessWidget {
  final TUIChatGlobalModel globalModel = serviceLocator<TUIChatGlobalModel>();
  TUIChatSeparateViewModel? model;
  final TUIGroupListenerModel groupListenerModel = serviceLocator<TUIGroupListenerModel>();
  final TUIThemeViewModel themeViewModel = serviceLocator<TUIThemeViewModel>();
  final Widget? child;
  final CustomImController? customImController;

  /// You could get the model from here, and transfer it to other widget from TUIKit.
  final Widget Function(BuildContext, TUIChatSeparateViewModel, Widget?) builder;
  final List<SingleChildWidget>? providers;

  /// `TIMUIKitChatController` needs to be provided if you use it outside.
  final TIMUIKitChatController? controller;

  /// The global config for TIMUIKitChat.
  final TIMUIKitChatConfig? config;

  /// Conversation id, use for get history message list.
  final String conversationID;

  final String? groupID;

  /// Conversation type
  final ConvType conversationType;

  /// The life cycle for chat business logic.
  final ChatLifeCycle? lifeCycle;

  /// The controller for text field.
  final TIMUIKitInputTextFieldController? textFieldController;

  final bool? isBuild;

  final AutoScrollController? scrollController;

  /// An optional parameter `groupMemberList` can be provided.
  /// `groupMemberList` accepts a list of nullable `V2TimGroupMemberFullInfo` objects.
  /// The purpose of this parameter is to allow the client to supply a pre-fetched list
  /// of group member information. If this list is provided, it will not make
  /// additional network requests to fetch the group member information internally.
  List<V2TimGroupMemberFullInfo?>? groupMemberList;

  TIMUIKitChatProviderScope(
      {Key? key,
      this.child,
      this.providers,
      this.groupMemberList,
      this.textFieldController,
      required this.builder,
      this.model,
      this.groupID,
      this.isBuild,
      required this.conversationID,
      required this.conversationType,
      this.controller,
      this.config,
      this.lifeCycle,
      this.scrollController,
        this.customImController})
      : super(key: key) {
    if (isBuild ?? false) {
      return;
    }
    model ??= TUIChatSeparateViewModel();
    controller?.model = model;
    controller?.textFieldController = textFieldController;
    controller?.scrollController = scrollController;
    if (config != null) {
      model?.chatConfig = config!;
    }
    model?.lifeCycle = lifeCycle;
    model?.initForEachConversation(
      conversationType,
      conversationID,
      (String value) {
        textFieldController?.textEditingController?.text = value;
      },
      preGroupMemberList: groupMemberList,
      groupID: groupID,
    );
    model?.showC2cMessageEditStatus = (conversationType == ConvType.c2c ? config?.showC2cMessageEditStatus ?? true : false);
    loadData();
  }

  loadData() {
    // if (model!.haveMoreData) {
    model!.loadChatRecord(count: kIsWeb ? 15 : HistoryMessageDartConstant.getCount);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: model),
        ChangeNotifierProvider.value(value: globalModel),
        ChangeNotifierProvider.value(value: themeViewModel),
        ChangeNotifierProvider.value(value: groupListenerModel),
        ChangeNotifierProvider.value(value: CustomMsgCountleftModel()),
        Provider(create: (_) => const TIMUIKitChatConfig()),
        ...?providers
      ],
      child: child,
      builder: (context, w) => builder(context, model!, w),
    );
  }

}
