import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


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
    String path = join(databasesPath, "event.db");
    var theDatabase = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDatabase;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE " + EVENT_TABLE_NAME + " (accountKey  VARCHAR (30) NOT NULL UNIQUE PRIMARY KEY,accountUrl VARCHAR (200) ,account VARCHAR (200) ,accountPWD  VARCHAR (250) ,accountDesc VARCHAR (255)  NOT NULL,dataType VARCHAR (8) NOT NULL)");
  }

  Future closeDb() async {
    var dbClient = await db;
    return dbClient.close();
  }
}