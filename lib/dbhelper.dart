import 'dart:io';

import 'package:datapersistence/model/course.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;

  DbHelper.internal();
  static Database _db;

  Future<Database> getDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'eng_mar_dict.db');
    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      var data = await rootBundle.load(join('assets', 'eng_mar_dict.db'));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path);
  }

  Future<int> createCourse(Course course) async {
    Database db = await getDB();
    //db.rawInsert('insert into courses value')
    return db.insert('History', course.toMap());
  }

  Future<List> allCourses() async {
    Database db = await getDB();
    //db.rawQuery('select * from courses');
    return db.query('Dictionary');
  }

  Future<int> delete(int id) async {
    Database db = await getDB();
    return db.delete('Dictionary', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> courseUpdate(Course course) async {
    Database db = await getDB();
    return await db.update('Dictionary', course.toMap(),
        where: 'id = ?', whereArgs: [course.id]);
  }
}
