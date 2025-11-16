import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "favorites.db");

    return await openDatabase(
      path,
      version: 2, // 🔥 IMPORTANT: UPDATED VERSION (1 → 2)
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE favorites(
            id TEXT PRIMARY KEY,
            title TEXT,
            image TEXT,
            company TEXT,
            detail TEXT
          );
        """);
      },

      // 🔥 For existing users — add missing columns
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute("ALTER TABLE favorites ADD COLUMN company TEXT;");
          await db.execute("ALTER TABLE favorites ADD COLUMN detail TEXT;");
        }
      },
    );
  }
}
