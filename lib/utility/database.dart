import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/model.dart';

class DBProvider {
  static const TABLE_NAME = "db005";
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "P.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE " + TABLE_NAME + " "
              "(id INTEGER PRIMARY KEY AUTOINCREMENT,accountUrl VARCHAR (200) ,account VARCHAR (200) ,"
              "accountPWD  VARCHAR (250) ,accountDesc VARCHAR (255)  NOT NULL,dataType VARCHAR (8) NOT NULL)"
          );
        });
  }

  newData(Model data) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM '$TABLE_NAME'");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into '$TABLE_NAME' (id,accountUrl,account,accountPWD,accountDesc,dataType)"
            " VALUES (?,?,?,?,?,?)",
        [id, data.accountUrl, data.account, data.accountPwd,data.accountDesc,data.typeId]);
    return raw;
  }

  getDataById(int id) async {
    final db = await database;
    var res = await db.query("$TABLE_NAME", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Model.fromJson(res.first) : null;
  }

  Future<List<Model>> getDatasByType(String dataType) async {
    final db = await database;
    var res = await db.query("$TABLE_NAME", where: "dataType = ?", whereArgs: [dataType]);
    List<Model> list =
    res.isNotEmpty ? res.map((c) => Model.fromJson(c)).toList() : [];
    return list;
  }

  Future<List<Model>> getAllDatas() async {
    final db = await database;
    var res = await db.query("$TABLE_NAME");
    List<Model> list =
    res.isNotEmpty ? res.map((c) => Model.fromJson(c)).toList() : [];
    return list;
  }

  deleteData(int id) async {
    final db = await database;
    return db.delete('$TABLE_NAME', where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from '$TABLE_NAME'");
  }
}
