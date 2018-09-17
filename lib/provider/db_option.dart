import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseOption {
  static getName() {
    return "find_tutors.db";
  }

  static getVersion() {
    return 1;
  }

  static getPath() async {
    String dbPath = await getDatabasesPath();
    return join(dbPath, DatabaseOption.getName());
  }
}
