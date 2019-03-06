/**
 * 单例全局变量
**/

import '../model/model.dart';

class MyGlobal{
  static final MyGlobal _singleton = new MyGlobal._internal();
  List<TypeModel> typeList = List();
  factory MyGlobal() {
    return _singleton;
  }

  MyGlobal._internal();
}