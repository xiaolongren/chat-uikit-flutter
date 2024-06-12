import 'dart:collection';
import 'dart:convert';

import 'package:dufubase/db/DBHelper.dart';
import 'package:dufubase/eventbus/EventBusSingleton.dart';
import 'package:dufubase/eventbus/FreeMsgCountEvent.dart';
import 'package:dufubase/request/ApiClient.dart';
import 'package:dufubase/request/Result.dart';
import 'package:dufubase/util/MDateUtils.dart';
import 'package:tencent_cloud_chat_uikit/ui/custom/entity/FreeMsgCount.dart';

class MsgCountApi {
  static String ymd="";
  static Future<FreeMsgCount?> getGivedOrderMsgCount(
      int selfUid, int remoteUid) async {
    List<Map<String, dynamic>> data = await DBHelper.queryData(
        DBHelper.TABLE_DUFU_msgcount,
        where: 'selfUid=? and remoteUid=? and type=2',
        whereArgs: [selfUid, remoteUid]);
    if(data==null||data.length==0){
       return Future.value(null);
    }
    FreeMsgCount msgCount = FreeMsgCount.fromJson(data[0]);
    return Future.value(msgCount) ;
  }

  static Future<FreeMsgCount?> getDayMsgCount(int selfUid, int remoteUid) async {
    List<Map<String, dynamic>> daydata = await DBHelper.queryData(
        DBHelper.TABLE_DUFU_msgcount,
        where: 'selfUid=? and remoteUid=? and type=1 and day=?',
        whereArgs: [
          selfUid,
          remoteUid,
         ymd
        ]);

    if (daydata.isNotEmpty) {
      FreeMsgCount msgCount = FreeMsgCount.fromJson(daydata[0]);
      return  Future.value(msgCount);;
    } else {
      //这里，从服务器获取赠送条数，
     Result<int> res= await fetchDayFreeMsgCount(selfUid,remoteUid);
     print("fetch msg:"+res.errorMsg+" "+res.data!.toString()+" remoteUid:"+remoteUid.toString());
     if(res.errorCode==0&&res.data!=null&&res.data!>0){
       FreeMsgCount msgCount = FreeMsgCount(0, selfUid, remoteUid,
           ymd, res.data!, 1);
       Map<String,dynamic> data=msgCount.toJson();
       data.remove("id");
       await DBHelper.insertData(DBHelper.TABLE_DUFU_msgcount, data)
           .then((value) {
         print("insert TABLE_DUFU_msgcount: " + value.toString());
       });
       return Future.value(msgCount);
     }
     return Future.value(null);

     }
  }

  /**
   * 从服务器查询当天赠送的免费条数，如果是已经赠送过了，则返回0
   */
  static Future<Result<int>>  fetchDayFreeMsgCount(int uid,int remoteUid){
    //getDayFreeMsgCount

    Map<String, Object> param = HashMap();
    param['uid']=uid;
    param['remoteUid']=remoteUid;


    return ApiClient.instance.get<int>(
        "usergroup/im/commen/getDayFreeMsgCount",
        queryParameters: param,
            (json) => Result.fromJsonInt(json),
        misList: false);

}
  static giveOrderMsgcount(int selfUid, int remoteUid, int count) async{
    FreeMsgCount? ordermsgcount=  await getGivedOrderMsgCount(selfUid,remoteUid);
    if(ordermsgcount!=null){
      ordermsgcount.count=count;
      Map<String,dynamic> data=ordermsgcount.toJson();
      DBHelper.updateData(DBHelper.TABLE_DUFU_msgcount, data, where: "id=?", whereArgs: [data['id']]).then((value) => {
        showMsgCount(selfUid,remoteUid)
      });

      return ;
    }


    FreeMsgCount msgCount = FreeMsgCount(0, selfUid, remoteUid, "", count, 2);
    Map<String,dynamic> data=msgCount.toJson();
    data.remove("id");
    DBHelper.insertData(DBHelper.TABLE_DUFU_msgcount, data)
        .then((value) {
      showMsgCount(selfUid,remoteUid);

     });
  }

  static consume(int selfUid, int remoteUid) async {
    //订单赠送条数,多个订单赠送不会累加， 如果下单后赠送的条数比当前还未使用完的订单赠送条数大，则会更新成新赠送的条数。
    //订单结束后，赠送的条数将会被归零。如果还存在未结束的订单，则不清零。
    //优先扣除订单赠送的条数

    FreeMsgCount? orderMsgCount = await getGivedOrderMsgCount(selfUid, remoteUid);
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
      FreeMsgCountEvent event = FreeMsgCountEvent();
      event.count = orderMsgCount.count;
      EventBusSingleton.getInstance().fire(event);
    } else {
      FreeMsgCount? dayMsgCount = await getDayMsgCount(selfUid, remoteUid);

      if (dayMsgCount != null) {
        dayMsgCount.count = dayMsgCount.count - 1;
        DBHelper.updateData(DBHelper.TABLE_DUFU_msgcount, dayMsgCount.toJson(),
            where: "id=?", whereArgs: [dayMsgCount.id]);
      } else {
        // dayMsgCount = FreeMsgCount(0, selfUid, remoteUid,
        //     ymd, 4, 1);
        // DBHelper.insertData(DBHelper.TABLE_DUFU_msgcount, dayMsgCount.toJson())
        //     .then((value) {
        //   print("insert TABLE_DUFU_msgcount day: " + value.toString());
        // });
      }
      FreeMsgCountEvent event = FreeMsgCountEvent();
      event.count = dayMsgCount!=null?dayMsgCount.count:0;
      print("consume:"+event.count.toString());
      EventBusSingleton.getInstance().fire(event);
    }
  }
//当不在订单进行中时，输入框显示剩余免费聊天条数
  static showMsgCount(int selftUid, int remoteUid) async {
    FreeMsgCount? dayMsgCount = await getDayMsgCount(selftUid, remoteUid);

    print("showMsgCount:"+(dayMsgCount==null?"0":dayMsgCount!.count.toString()));

    FreeMsgCount? orderMsgCount = await getGivedOrderMsgCount(selftUid, remoteUid);
    if (orderMsgCount != null && orderMsgCount.count > 0) {
      FreeMsgCountEvent event = FreeMsgCountEvent();
      event.count = orderMsgCount.count;
      EventBusSingleton.getInstance().fire(event);
    } else if (dayMsgCount != null && dayMsgCount.count > 0) {
      FreeMsgCountEvent event = FreeMsgCountEvent();
      event.count = dayMsgCount.count;
      EventBusSingleton.getInstance().fire(event);
    } else {
      FreeMsgCountEvent event = FreeMsgCountEvent();
      event.count = 0;
      EventBusSingleton.getInstance().fire(event);
    }
  }
}
