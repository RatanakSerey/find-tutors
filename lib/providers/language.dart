import 'dart:async';
import '../models/language.dart';
import '../providers/db_option.dart';
import 'package:sqflite/sqflite.dart';

class LanguageProvider {
  final String tableName = 'tbllanguage';
  final String id = 'id';
  final String code = 'code';
  final String name = 'name';
  Database db;

  Future open() async {
    return db = await openDatabase(await DatabaseOption.getPath(),
        version: DatabaseOption.getVersion(),
        onCreate: (Database db, int version) async {});
  }

  Future createTable() async {
    await open();
    return await db.execute('''
                          CREATE TABLE IF NOT EXISTS $tableName (
                                        $id INTEGER PRIMARY KEY AUTOINCREMENT, 
                                        $code TEXT NOT NULL,
                                        $name TEXT NOT NULL
                          )
      ''');
  }

  Future getLanguage() async {
    await open();
    List<Map> map = await db.query(tableName);

    return map;
  }

  Future count() async {
    await open();
    return await db
        .rawQuery('''SELECT COUNT(*) AS count, $code, $name FROM $tableName''');
  }

  Future<Language> insert(Language language) async {
    await open();
    await db.insert(tableName, language.toMap());
    return language;
  }

  Future update(Language language, int id) async {
    await open();
    return await db
        .update(tableName, language.toMap(), where: "$id = ?", whereArgs: [id]);
  }

  Future delete(int id) async {
    await open();
    return await db.delete(tableName, where: "$id = ?", whereArgs: [id]);
  }

  Future deleteAll() async {
    await open();
    return await db.execute('''DELETE FROM $tableName''');
  }

  Future dropTable() async {
    await open();
    return await db.execute('''DROP TABLE $tableName''');
  }

  Future close() async => db.close();
}
