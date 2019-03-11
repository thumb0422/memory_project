/**
 * 工具类，比如存储数据库
**/
import 'dart:async';
import '../model/model.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

///加载本地文件
Future<List<TypeModel>> getLocalTypeModels() async {
  List<TypeModel> resultList = List();
  String jsonData = await rootBundle.loadString('assets/typeConfig.json');
  List list = json.decode(jsonData);
  list.forEach((item){
    TypeModel typeModel = TypeModel.fromJson(item);
    resultList.add(typeModel);
  });
  return resultList;
}