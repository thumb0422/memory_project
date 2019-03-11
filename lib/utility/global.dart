/**
 * 单例全局变量
**/
import 'package:flutter/material.dart';
import '../model/model.dart';

class MyGlobal {
  static final MyGlobal _singleton = new MyGlobal._internal();
  List<TypeModel> typeList = List();
  factory MyGlobal() {
    return _singleton;
  }

  MyGlobal._internal();
}

Color pageBgColor = Color(0xFFF3FFD4);
