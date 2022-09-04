import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  //private constructor
  DatabaseManager._privateConstructor();
  static DatabaseManager instance = DatabaseManager._privateConstructor();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future _initDB() async {
    // kita buat table databasenya ( SQFLITE - SQL )
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, "note.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async => await database.execute(
        '''
            CREATE TABLE notes (
              id INTEGER PRIMARY KEY,
              title TEXT NOT NULL,
              desc TEXT NOT NULL
            )
          ''',
      ),
    );
  }

  Future closeDB() async {
    _db = await instance.db;
    _db!.close();
  }
}
