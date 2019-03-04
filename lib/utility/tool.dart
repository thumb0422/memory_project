/**
 * 工具类，比如存储数据库
**/
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/model.dart';
import 'package:json_parser/json_parser.dart';

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

Future<List<TypeModel>> loadAsset() async {
  String jsonData = await rootBundle.loadString('assets/config.json');
  JsonParser parser = new JsonParser();
  List instance = parser.parseJson<TypeModel>(jsonData);
  return instance;
}