import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// return the path
Future<String> initDb(String dbName) async {
  var databasePath = await getDatabasesPath();
  // print(databasePath);
  String path = join(databasePath, dbName);

  Database db = await openDatabase(path);

  // make sure the folder exists
  if (await Directory(dirname(path)).exists()) {
//    await deleteDatabase(path);
    Database db = await openDatabase(path);
    var sqfliteOptions = SqfliteOptions()..queryAsMapList = true;
    // ignore: deprecated_member_use
    await Sqflite.devSetOptions(sqfliteOptions);
    String sql =
        "select count(*) as count1 from sqlite_master where type='table' and name = 'db005'";
    // ignore: deprecated_member_use
    var result = await db.devInvokeSqlMethod("query", sql);
    if (result[0]["count1"] == 0) {
      await db.execute(
          "CREATE TABLE db005 (accountKey  VARCHAR (30) NOT NULL UNIQUE PRIMARY KEY,accountUrl VARCHAR (200) ,account VARCHAR (200) ,accountPWD  VARCHAR (250) ,accountDesc VARCHAR (255)  NOT NULL,dataType VARCHAR (8) NOT NULL)");
    }
  } else {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      print(e);
    }
  }
  return path;
}
