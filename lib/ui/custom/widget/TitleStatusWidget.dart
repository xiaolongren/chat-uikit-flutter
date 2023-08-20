import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TitleStatusWidget extends StatefulWidget {
  final String title;
  final String onlineStatus;

  TitleStatusWidget({
    required this.title,
    required this.onlineStatus,
    super.key,
  }) ;

  @override
  TitleStatusWidgetState createState() => TitleStatusWidgetState();
}

class TitleStatusWidgetState extends State<TitleStatusWidget> {
  String onlineStatus = '';
  String title='';

  @override
  void initState() {
    super.initState();
    onlineStatus = widget.onlineStatus;
    title=widget.title;
  }

  void updateOnlineStatus(String status) {
    setState(() {
      onlineStatus = status;
    });
  }
  void updateOnlineStatusAndNick(String mtitle,String status) {
    setState(() {
      onlineStatus = status;
      title=mtitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor = getStatusColor(onlineStatus);

    return
      Container(child: Column(
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
      ),width: double.infinity, padding: EdgeInsets.only(right: 50),)
      ;
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
