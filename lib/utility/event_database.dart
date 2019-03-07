import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/model.dart';

class EventsDatabase {
  static const EVENT_TABLE_NAME = "db005";
  static final EventsDatabase _instance = EventsDatabase._internal();

  factory EventsDatabase() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  EventsDatabase._internal();

  Future<Database> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "p.db");
    var theDatabase = await openDatabase(path, version: 1,onOpen: (_db){ }, onCreate: _onCreate);
    return theDatabase;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE " + EVENT_TABLE_NAME + " (ID INTEGER PRIMARY KEY AUTOINCREMENT,accountUrl VARCHAR (200) ,account VARCHAR (200) ,accountPWD  VARCHAR (250) ,accountDesc VARCHAR (255)  NOT NULL,dataType VARCHAR (8) NOT NULL)");
  }

  Future closeDb() async {
    var dbClient = await db;
    return dbClient.close();
  }

  createData(Model data) async{
    var dbClient = await db;
    var result = await dbClient.insert('$EVENT_TABLE_NAME', data.toJson());
    return result;
  }

  deleteData(Model data) async{
    var dbClient = await db;
    dbClient.rawDelete("Delete * from '$EVENT_TABLE_NAME'");
  }

  getDataByType(String type) async {
    var dbClient = await db;
    String sqlStr = 'select * from $EVENT_TABLE_NAME where 1=1';
    if (null == type){

    }else {
      sqlStr = sqlStr + ' and dataType = "$type"';
    }
    var res = await dbClient.rawQuery(sqlStr);
    List<Model> list = res.isNotEmpty ? res.toList().map((c) => Model.fromJson(c)) : null;
    return list;
  }

  getDataById(int id) async {
    final dbClient = await db;
    var res = await  dbClient.query('$EVENT_TABLE_NAME', where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Model.fromJson(res.first) : Null ;
  }
}