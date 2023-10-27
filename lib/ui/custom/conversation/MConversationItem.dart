import 'dart:async';

import 'package:dufubase/eventbus/EventBusSingleton.dart';
import 'package:dufubase/eventbus/OptionMsgChangeEvent.dart';
import 'package:dufubase/router/ARouter.dart';
import 'package:dufubase/router/constants/RoutingTable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/widgets/avatar.dart';

import '../constants/CustomConversationId.dart';

class MConversationItem extends StatefulWidget {
  V2TimConversation conversationItem;

  MConversationItem(this.conversationItem);

  @override
  State<StatefulWidget> createState() {
    return MConversationItemState();
  }
}

class MConversationItemState extends State<MConversationItem> {
  String lastmsg = "";
  int unReadCount = 0;
  String? showTime;
  StreamSubscription? optionMsgSubscription;

  @override
  void initState() {
    super.initState();

    // //监听 互动消息和系统消息的变化。当切换到会话列表页时，请求接口获取互动消息/系统消息的未读数和最后一条消息title
    // if (optionMsgSubscription == null)
    //   optionMsgSubscription =
    //       EventBusSingleton.getInstance().on<OptionMsgChangeEvent>().listen((
    //           event) {
    //         if (event.conversationId ==
    //             widget.conversationItem.conversationID) {
    //           if (mounted) {
    //             setState(() {
    //               lastmsg = event.lastMsg;
    //               unReadCount = event.unReadCount;
    //               showTime = event.showTime;
    //             });
    //           }
    //         }
    //       }
    //
    //       );
    if (faceUrl.isEmpty) {
      TencentImSDKPlugin.v2TIMManager.getUsersInfo(
          userIDList: [widget.conversationItem.userID!]).then((value) {
        if (value.code == 0 && value.data != null && value.data!.length > 0) {
          setState(() {
            this.faceUrl = value.data![0]!.faceUrl!;
            print("faceUrl:" + this.faceUrl);
          });
        }
      }); //需要查询的用户id列表

    }


    // EventBusSingleton.getInstance().on<OptionMsgChangeEvent>().listen((event) {
    //   //
    //
    // });

  }

  String faceUrl = "";

  @override
  Widget build(BuildContext context) {
    // if (optionMsgSubscription != null && optionMsgSubscription!.isPaused) {
    //   optionMsgSubscription!.resume();
    // }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 75,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,

              height: 72,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(
                    width: 13,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                          height: 53,
                          width: 53,
                          child: Container(child: Avatar(faceUrl: faceUrl,
                            showName: " ",
                            borderRadius: BorderRadius.circular(50),),
                            margin: EdgeInsets.all(4),)
                      ),

                      if(widget.conversationItem.unreadCount! > 0)
                        Positioned(
                          right: 2,
                          top: 2,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle
                            ),
                          ),
                        )
                    ],
                  ),
                  Expanded(child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                parseTitle(),
                                style: TextStyle(
                                    fontSize: 17,
                                    color: TUITheme()
                                        .conversationItemTitleTextColor),
                              ),

                              Text(
                                this.showTime ?? "",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: TUITheme()
                                        .conversationItemTitmeTextColor!),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(

                            margin: EdgeInsets.only(left: 8),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              parseSubtitle(widget.conversationItem.lastMessage?.customElem?.desc??""),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: TUITheme()
                                      .conversationItemLastMessageTextColor),
                            )),
                      ],
                    ),
                    padding: EdgeInsets.only(top: 4, bottom: 4),
                  ))

                ],
              ),
            ),
            Divider(
              height: 0.5,
              color: Color.fromARGB(255, 230, 230, 230),
            )
          ],
        ),
      ),
      onTap: () {
        if (widget.conversationItem.conversationID ==
            CustomConversationId.INTERACTION_MSG) {
          markRead(widget.conversationItem.userID!);
          ARouter(RoutingTable.interactionMsgPage).push();
        } else if (widget.conversationItem.conversationID ==
            CustomConversationId.DayPush_MSG) {
          ARouter(RoutingTable.daypushMsgPage).push();
        } else if (widget.conversationItem.conversationID ==
            CustomConversationId.SYS_MSG) {
          ARouter(RoutingTable.systemMsgPage).push();
        }
      },
    );
  }

  String parseTitle() {
    String title = "系统消息";
    print("widget.conversationItem.conversationID:"+widget.conversationItem.conversationID.toString());
    if (widget.conversationItem.conversationID ==
        CustomConversationId.INTERACTION_MSG) {
      title = "互动消息";
    } else if (widget.conversationItem.conversationID ==
        CustomConversationId.DayPush_MSG) {
      title = "美文甄选";
    }
    return title;
  }
  markRead(String imid) async {
    // 设置单聊消息已读
    V2TimCallback markC2CMessageAsReadRes = await TencentImSDKPlugin
        .v2TIMManager
        .getMessageManager()
        .markC2CMessageAsRead(userID: imid); // 需要设置消息已读的用户id
    if (markC2CMessageAsReadRes.code == 0) {
      // 标记成功
    }
  }
  String parseSubtitle(String text) {
    int maxLength = 15;

    String displayedText =
    text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
    return displayedText;
  }

  @override
  void dispose() {
    // 取消事件监听
    if (optionMsgSubscription != null) {
      optionMsgSubscription!.cancel();
      optionMsgSubscription == null;
    }

    super.dispose();
  }
}
