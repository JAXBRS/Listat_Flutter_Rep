import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db!;
  }

  Future<Database> initializeDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'listat.db');
    Database myDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDb;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS listat (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        email TEXT, 
        password TEXT, 
        name TEXT, 
        description TEXT, 
        type TEXT, 
        numitems INTEGER, 
        parent INTEGER)
    ''');
    print("Database created");
  }

  Future<int> insertData(String sql, [List<dynamic>? arguments]) async {
    Database dbClient = await db;
    int response = await dbClient.rawInsert(sql, arguments);
    return response;
  }

  Future<List<Map<String, dynamic>>> readData(String sql,
      [List<dynamic>? arguments]) async {
    Database dbClient = await db;
    List<Map<String, dynamic>> response =
        await dbClient.rawQuery(sql, arguments);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }
}
