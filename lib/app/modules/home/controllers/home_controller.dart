import 'package:get/get.dart';
import 'package:penerapan_sqflite/app/data/db/db_manager.dart';
import 'package:penerapan_sqflite/app/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  RxList allNote = <Note>[].obs;
  DatabaseManager database = DatabaseManager.instance;

  Future<void> getAllnotes() async {
    Database dbs = await database.db;
    List<Map<String, dynamic>> data = await dbs.query("notes");

    if (data.isNotEmpty) {
      allNote(Note.toJsonList(data));
      allNote.refresh();
    } else {
      allNote.clear();
      allNote.refresh();
    }
  }

  Future deleteNote(int id) async {
    Database dbs = await database.db;
    await dbs.delete("notes", where: 'id = ?', whereArgs: [id]);
    await getAllnotes();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllnotes();
    super.onInit();
  }
}
