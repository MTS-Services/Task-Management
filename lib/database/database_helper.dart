import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:maktrack/model/task.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _databaseName = "tasks.db";
  static final String _tableName = "tasks"; // Correct table name

  static Future<void> initDatabase() async {
    if (_db != null) return; // Don't initialize again if already initialized
    try {
      String path = join(await getDatabasesPath(), _databaseName);
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $_tableName ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title TEXT," // Changed from STRING to TEXT
            "note TEXT," // Changed from STRING to TEXT
            "isCompleted INTEGER,"
            "date TEXT," // Changed from STRING to TEXT
            "startTime TEXT," // Changed from STRING to TEXT
            "endTime TEXT," // Changed from STRING to TEXT
            "color TEXT," // Changed from STRING to TEXT
            "reminder INTEGER,"
            "repeat TEXT)", // Changed from STRING to TEXT
          );
        },
      );
    } catch (e) {
      print("Database initialization error: $e");
    }
  }

  static Future<int> insert(Task task) async {
    return await _db?.insert(_tableName, task.toJson()) ?? 1; // Use table name
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName); // Use table name
  }

  static Future<int> delete(Task task) async {
    return await _db!.delete(
      _tableName, // Use table name
      where: "id = ?",
      whereArgs: [task.id],
    );
  }
}
