import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'neuronote.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE tasks (
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            date TEXT,
            time TEXT,
            type TEXT
          )
        ''');
      },
    );
  }

  static Future<void> insertTask(Map<String, dynamic> task) async {
    final db = await database;
    await db.insert('tasks', task, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;
    return db.query('tasks', orderBy: 'date ASC');
  }
}
