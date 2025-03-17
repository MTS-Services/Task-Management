import 'package:maktrack/model/task.dart';
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
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            " title STRING,"
            " note STRING,"
            " isCompleted INTEGER,"
            " date STRING,"
            " startTime STRING,"
            " endTime STRING,"
            " color COLOR,"
            " reminder INTEGER,"
            " repeat STRING)",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print("insert function called");
    return await _db?.insert(_databaseName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_databaseName);
  }

  static delete(Task task) async {
    print("delete function called");
    return await _db!
        .delete(_databaseName, where: "id = ?", whereArgs: [task.id]);
  }
}
