import 'dart:convert';
import 'package:tencent_im_base/tencent_im_base.dart';

class CallingMessage {
  /// 发起邀请方
  String? inviter;
  String? msg;//显示的消息，如 正忙，如 对方拒绝了通话 如 对方挂断了通话

  /// 被邀请方
  List<String>? inviteeList;

  //1 语音 2 视频
  int? callType=1;

  // 1: 邀请方发起邀请
  // 2: 邀请方取消邀请
  // 3: 被邀请方接受邀请
  // 4: 被邀请方拒绝邀请
  // 5: 邀请超时
  int? actionType;

  /// 邀请ID
  String? inviteID;

  /// 通话时间
  int? timeout;

  /// 通话房间
  int? roomID;
  String? roomIDStr;

  // 通话时间：秒，大于0代表通话时间
  int? callEnd;
  // 是否是群组通话
  bool? isGroup;

  CallingMessage(
      {this.inviter,
        this.actionType,
        this.inviteID,
        this.inviteeList,
        this.timeout,
        this.roomID,
        this.callType,
        this.callEnd,
        this.isGroup});

  CallingMessage.fromJSON(json) {
    // final detailData = jsonDecode(json["data"]);

    final detailData = json["data"]  ;
    if(detailData.toString().contains("{")){
      Map<String, dynamic> obj=  jsonDecode(detailData);
      callType = obj["call_type"];
      roomID =  obj["room_id"];
      callEnd = obj["call_end"];
      isGroup = obj["is_group"];
      roomIDStr= obj["roomIDStr"];
    }else{
      callType = json["call_type"];
      roomID =  json["room_id"];
      callEnd = json["call_end"];
      isGroup = json["is_group"];
      roomIDStr= json["roomIDStr"];
    }
    actionType = json["actionType"];
    timeout = json["timeout"];
    inviter = json["inviter"];
    msg = json["msg"];
    Object obj=json["inviteeList"];
    if(obj is String&&obj.length>0&&obj!="null"){
      inviteeList = List<String>.from(jsonDecode(json["inviteeList"]));

    }else{
      if(obj!="null")
      inviteeList = List<String>.from( json["inviteeList"]);

    }
    inviteID = json["inviteID"];

  }
  toJSon(){
    return {
      "call_type":this.callType,
      "room_id":this.roomID,
      "is_group":this.isGroup,
      "call_end":this.callEnd,
      "timeout":this.timeout,
      "inviter":this.inviter,
      "inviteID":this.inviteID,
      "actionType":this.actionType,
      "inviteeList":this.inviteeList!=null?jsonEncode(this.inviteeList):"",
      "msg":this.msg,
      "roomIDStr":this.roomIDStr,

    };
  }

  static CallingMessage? getCallMessage(V2TimCustomElem? customElem) {
    try {
      if (customElem?.data != null) {
        final customMessage = jsonDecode(customElem!.data!);
        return CallingMessage.fromJSON(customMessage);
      }
      return null;
    } catch (err) {
      return null;
    }
  }

  static String getActionType(int actionType) {
    final actionMessage = {
      1: TIM_t("发起通话"),
      2: TIM_t("取消通话"),
      3: TIM_t("接受通话"),
      4: TIM_t("拒绝通话"),
      5: TIM_t("超时未接听"),
    };
    return actionMessage[actionType] ?? "";
  }
  static String getActionTypeWithFrom(int actionType,bool isSelf) {

    final actionMessage = {
      1: TIM_t("发起通话"),
      2: TIM_t("取消通话"),
      3: TIM_t("接受通话"),
      4: TIM_t("拒绝通话"),
      5: TIM_t("超时未接听"),
    };
    if(actionType==4){
      return  isSelf?TIM_t("已拒绝"):TIM_t("对方已拒绝");
    }
    if(actionType==2){
      return  isSelf?TIM_t("取消通话"):TIM_t("对方取消通话");
    }
    return actionMessage[actionType] ?? "";
  }

  static isCallEndExist(CallingMessage callMsg) {
    int? callEnd = callMsg.callEnd;
    int? actionType = callMsg.actionType;
    if (actionType == 2) return false;
    return callEnd == null
        ? false
        : callEnd > 0
        ? true
        : false;
  }

  static String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  static getShowTime(int seconds) {
    int secondsShow = seconds % 60;
    int minutesShow = seconds ~/ 60;
    return "${twoDigits(minutesShow)}:${twoDigits(secondsShow)}";
  }
}