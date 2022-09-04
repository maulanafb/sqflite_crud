import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:penerapan_sqflite/app/data/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';

class EditDataController extends GetxController {
  RxBool isLoading = false.obs;

  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  DatabaseManager database = DatabaseManager.instance;

  void editData(int id) async {
    Database db = await database.db;
    db.update(
      "notes",
      {
        "id": id,
        "title": titleC.text,
        "desc": descC.text,
      },
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
