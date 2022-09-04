import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:penerapan_sqflite/app/data/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';

class AddDataController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();
  DatabaseManager database = DatabaseManager.instance;

  void addNote() async {
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      isLoading.value = true;
      Database db = await database.db;
      await db.insert(
          "notes",
          {
            "title": titleC.text,
            "desc": descC.text,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
      isLoading.value = false;
    }
  }
}
