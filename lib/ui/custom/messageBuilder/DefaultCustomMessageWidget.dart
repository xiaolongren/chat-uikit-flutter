import 'package:flutter/cupertino.dart';

class DefaultCustomMessageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(child: Center(child: Text("不支持的消息类型，请升级app"),),width: 150,);
  }

}