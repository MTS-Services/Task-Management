
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:maktrack/model/task.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _databaseName = "tasks.db";

  static Future<void> initDatabase() async {
    if (_db != null) return; // Don't initialize again if already initialized
    try {
      String path = join(await getDatabasesPath(), _databaseName);
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $_databaseName("
                "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                "title STRING,"
                "note STRING,"
                "isCompleted INTEGER,"
                "date STRING,"
                "startTime STRING,"
                "endTime STRING,"
                "color STRING," // Store color as string
                "reminder INTEGER,"
                "repeat STRING)",
          );
        },
      );
    } catch (e) {
      print("Database initialization error: $e");
    }
  }

  static Future<int> insert(Task task) async {
    return await _db?.insert(_databaseName, task.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_databaseName);
  }

  static Future<int> delete(Task task) async {
    return await _db!.delete(
      _databaseName,
      where: "id = ?",
      whereArgs: [task.id],
    );
  }
}

