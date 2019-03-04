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
  String jsonData = await rootBundle.loadString('assets/typeConfig.json');
  Map decoded = jsonDecode(jsonData);

  return null;
}