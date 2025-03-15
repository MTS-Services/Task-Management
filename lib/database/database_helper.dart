import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _databaseName = "tasks";

  static Future<void> initDatabase() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + "tasks.db";
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("Creating a new one");
          return db.execute(
            "CREATE TABLE $_databaseName("
            "id INTEGER PRIMARY KEY,"
            " title TEXT,"
            " note TEXT,"
            " isCompleted INTEGER,"
            " date TEXT,"
            " startTime TEXT,"
            " endTime TEXT,"
            " color TEXT,"
            " reminder INTEGER,"
            " repeat TEXT)",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
