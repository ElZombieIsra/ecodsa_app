import 'dart:io';

import 'package:ecodsa_app/models/user.dart';
import 'package:hive/hive.dart';

class DatabaseHelper {
  static DatabaseHelper _instance = DatabaseHelper.internal();
  DatabaseHelper.internal() {
    Hive.init(Directory.current.path);
    Hive.openBox<User>("User");
  }
  factory DatabaseHelper() => _instance;
}
