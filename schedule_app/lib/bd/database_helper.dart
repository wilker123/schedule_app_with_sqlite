import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  // ignore: prefer_typing_uninitialized_variables
  static late var database;

  Future<Database> getDB() async {
    database = openDatabase(join(await getDatabasesPath(), 'bdcurso.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE contact(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT)",
      );
    }, version: 1);
    return database;
  }
}
