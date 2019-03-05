/**
 * 工具类，比如存储数据库
**/
import 'dart:async';
import '../model/model.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class DBManager {
  Model data;
  DBManager(this.data);
  /**
   * CreateDB
   */
  createDB() {
    
  }

  /**
   * QueryData
   */
  queryData() {}

  /**
   *SaveData
   */
  saveData() {}
  /**
   * UpdateData
   */
  updateData() {}

  /**
   * DeleteData
   */
  deleteData() {}
}

Future<List<TypeModel>> getLocalTypeModels() async {
  List resultList = List();
  String jsonData = await rootBundle.loadString('assets/typeConfig.json');
  List list = json.decode(jsonData);
  list.forEach((item){
    TypeModel typeModel = TypeModel.fromJson(item);
    resultList.add(typeModel);
  });
  print('count=');
  return resultList;
}