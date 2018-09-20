import 'dart:async';

import '../models/user.dart';
import '../providers/db_option.dart';
import 'package:sqflite/sqflite.dart';

class UserProvider {
  final String tableName = 'tbluser';
  final String id = 'id';
  final String userId = 'userId';
  final String username = 'username';
  final String email = 'email';
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
                                        $userId TEXT NOT NULL,
                                        $username TEXT NOT NULL,
                                        $email TEXT NOT NULL
                          )
      ''');
  }

  Future getUser() async {
    await open();
    List<Map> map = await db.query(tableName);

    return map;
  }

  Future<User> insert(User user) async {
    await open();
    await db.insert(tableName, user.toMap());
    return user;
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
