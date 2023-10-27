import 'dart:collection';
import 'dart:convert';

import 'package:dufubase/router/ARouter.dart';
import 'package:dufubase/router/constants/RoutingTable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TitleStatusWidget extends StatefulWidget {
  String title = "";
  String onlineStatus = "";
  int? uid;

  TitleStatusWidget({
    required this.title,
    required this.onlineStatus,
    this.uid,
    super.key,
  });

  @override
  TitleStatusWidgetState createState() => TitleStatusWidgetState();
}

class TitleStatusWidgetState extends State<TitleStatusWidget> {
  String onlineStatus = '';
  String title = '';

  @override
  void initState() {
    super.initState();
    onlineStatus = widget.onlineStatus;
    title = widget.title;
  }

  void updateOnlineStatus(String status) {
    setState(() {
      onlineStatus = status;
      widget.onlineStatus = onlineStatus;
    });
  }

  void updateOnlineStatusAndNick(String mtitle, String status) {
    setState(() {
      onlineStatus = status;
      title = mtitle;
      widget.title = mtitle;
      print("updateOnlineStatusAndNick：：" + mtitle);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor = getStatusColor(onlineStatus);

    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: statusColor,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      onlineStatus,
                      style: TextStyle(
                        fontSize: 12,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            child: GestureDetector(child: Container(
              height: 40,
              color: Colors.transparent,
              child: Center(
                child: Text(
                  "举报",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),onTap: (){
              //举报
              HashMap<String,String> hashMap=HashMap();
              hashMap['subject']="聊天举报";

              String ext=jsonEncode(hashMap);

              Future.delayed(Duration(milliseconds: 200),(){
                ARouter(RoutingTable.addComplaint).addParam("type", "1").addParam("targetUid", widget.uid.toString()??"0").addParam("ext", ext).push();

              });

            },)
            ,
          )
        ],
      ),
      width: double.infinity,
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case '在线':
      case '可接单':
        return Colors.green;
      case '忙碌中':
        return Colors.orange;
      case '通话中':
      case '正在为您服务中':
      case '服务中':
        return Colors.red;

      case '离线':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
