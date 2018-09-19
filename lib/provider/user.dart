import 'dart:async';
import 'package:path/path.dart';

import '../models/user.dart';
import '../provider/db_option.dart';
import 'package:sqflite/sqflite.dart';

final String tableUser = 'tbluser';
final String id = 'id';
final String userId = 'userId';
final String username = 'username';
final String email = 'email';

class UserProvider {
  Database db;

  Future createTable() async {
    await open();
    return await db.execute('''
                          CREATE TABLE $tableUser (
                                        $id INTEGER PRIMARY KEY AUTOINCREMENT, 
                                        $userId TEXT NOT NULL,
                                        $username TEXT NOT NULL,
                                        $email TEXT NOT NULL
                          )
      ''');
  }

  Future dropTable() async {
    await open();
    return await db.execute('''DROP TABLE $tableUser''');
  }

  Future open() async {
    return db = await openDatabase(await DatabaseOption.getPath(),
        version: DatabaseOption.getVersion(), onCreate: (Database db, int version) async {});
  }

  Future<User> insert(User user) async {
    await open();
    await db.insert(tableUser, user.toMap());
    return user;
  }

  Future getUser() async {
    await open();
    List<Map> map = await db.query(tableUser);

    return map;
  }

  Future delete(int id) async {
    await open();
    return await db.delete(tableUser, where: "$id = ?", whereArgs: [id]);
  }

  Future close() async => db.close();
}
