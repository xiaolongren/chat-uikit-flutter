import 'dart:convert';

import 'package:dufubase/db/DBHelper.dart';
import 'package:dufubase/eventbus/EventBusSingleton.dart';
import 'package:dufubase/eventbus/MsgCountEvent.dart';
import 'package:dufubase/util/MDateUtils.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/MsgCount.dart';

class MsgCountApi {
  static Future<MsgCount?> getGivedOrderMsgCount(
      int selfUid, int remoteUid) async {
    List<Map<String, dynamic>> data = await DBHelper.queryData(
        DBHelper.TABLE_DUFU_msgcount,
        where: 'selfUid=? and remoteUid=? and type=2',
        whereArgs: [selfUid, remoteUid]);
    if(data==null||data.length==0){

      return null;
    }
    MsgCount msgCount = MsgCount.fromJson(data[0]);
    return msgCount;
  }

  static Future<MsgCount> getDayMsgCount(int selfUid, int remoteUid) async {
    List<Map<String, dynamic>> daydata = await DBHelper.queryData(
        DBHelper.TABLE_DUFU_msgcount,
        where: 'selfUid=? and remoteUid=? and type=1 and day=?',
        whereArgs: [
          selfUid,
          remoteUid,
          MDateUtils.formatTimestamp(DateTime.now().millisecond)
        ]);

    if (daydata.isNotEmpty) {
      MsgCount msgCount = MsgCount.fromJson(daydata[0]);
      return msgCount;
    } else {
      MsgCount msgCount = MsgCount(0, selfUid, remoteUid,
          MDateUtils.formatTimestamp(DateTime.now().millisecond), 5, 1);
      await DBHelper.insertData(DBHelper.TABLE_DUFU_msgcount, msgCount.toJson())
          .then((value) {
        print("insert TABLE_DUFU_msgcount: " + value.toString());
      });
      return msgCount;
    }
  }

  static giveOrderMsgcount(int selfUid, int remoteUid, int count) {
    MsgCount msgCount = MsgCount(0, selfUid, remoteUid, "", count, 2);
    DBHelper.insertData(DBHelper.TABLE_DUFU_msgcount, msgCount.toJson())
        .then((value) {
      print("insert TABLE_DUFU_msgcount: " + value.toString());
    });
  }

  static consume(int selfUid, int remoteUid) async {
    //订单赠送条数,多个订单赠送不会累加， 如果下单后赠送的条数比当前还未使用完的订单赠送条数大，则会更新成新赠送的条数。
    //订单结束后，赠送的条数将会被归零。如果还存在未结束的订单，则不清零。
    //优先扣除订单赠送的条数

    MsgCount? orderMsgCount = await getGivedOrderMsgCount(selfUid, remoteUid);
    if (orderMsgCount != null) {
      orderMsgCount.count = orderMsgCount.count - 1;
      if (orderMsgCount.count <= 0) {
        DBHelper.deleteData(DBHelper.TABLE_DUFU_msgcount,
            where: "id=?", whereArgs: [orderMsgCount.id]);
      } else {
        DBHelper.updateData(
            DBHelper.TABLE_DUFU_msgcount, orderMsgCount.toJson(),
            where: "id=?", whereArgs: [orderMsgCount.id]);
      }
      MsgCountEvent event = MsgCountEvent();
      event.count = orderMsgCount.count;
      EventBusSingleton.getInstance().fire(event);
    } else {
      MsgCount dayMsgCount = await getDayMsgCount(selfUid, remoteUid);

      if (dayMsgCount != null) {
        dayMsgCount.count = dayMsgCount.count - 1;
        DBHelper.updateData(DBHelper.TABLE_DUFU_msgcount, dayMsgCount.toJson(),
            where: "id=?", whereArgs: [dayMsgCount.id]);
      } else {
        dayMsgCount = MsgCount(0, selfUid, remoteUid,
            MDateUtils.formatTimestamp(DateTime.now().millisecond), 4, 1);
        DBHelper.insertData(DBHelper.TABLE_DUFU_msgcount, dayMsgCount.toJson())
            .then((value) {
          print("insert TABLE_DUFU_msgcount day: " + value.toString());
        });
      }
      MsgCountEvent event = MsgCountEvent();
      event.count = dayMsgCount.count;
      EventBusSingleton.getInstance().fire(event);
    }
  }
//当不在订单进行中时，输入框显示剩余免费聊天条数
  static showMsgCount(int selftUid, int remoteUid) async {
    MsgCount dayMsgCount = await getDayMsgCount(selftUid, remoteUid);
    MsgCount? orderMsgCount = await getGivedOrderMsgCount(selftUid, remoteUid);
    if (orderMsgCount != null && orderMsgCount.count > 0) {
      MsgCountEvent event = MsgCountEvent();
      event.count = orderMsgCount.count;
      EventBusSingleton.getInstance().fire(event);
    } else if (dayMsgCount != null && dayMsgCount.count > 0) {
      MsgCountEvent event = MsgCountEvent();
      event.count = dayMsgCount.count;
      EventBusSingleton.getInstance().fire(event);
    } else {
      MsgCountEvent event = MsgCountEvent();
      event.count = 0;
      EventBusSingleton.getInstance().fire(event);
    }
  }
}
