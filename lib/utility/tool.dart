/**
 * 工具类，比如存储数据库
**/
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/model.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

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
  String jsonData = await rootBundle.loadString('assets/config.json');
//  JsonParser parser = new JsonParser();
//  List<TypeModel> datas = parser.parseJson<TypeModel>(jsonData);
//  print(datas[0]);
  return null;
}