import 'package:flutter/cupertino.dart';

class CustomMsgCountleftModel  extends ChangeNotifier {
  int msgleftCount=5;
  reduce(){
    --msgleftCount;
  }
}