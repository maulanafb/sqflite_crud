import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:penerapan_sqflite/app/data/models/note_model.dart';
import 'package:penerapan_sqflite/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getAllnotes(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Obx(() => (controller.allNote.length == 0)
                ? Center(
                    child: Text('Tidak Ada Data'),
                  )
                : ListView.builder(
                    itemCount: controller.allNote.length,
                    itemBuilder: (context, index) {
                      Note note = controller.allNote[index];
                      return ListTile(
                        onTap: () =>
                            Get.toNamed(Routes.EDIT_DATA, arguments: note),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            controller.deleteNote(note.id!);
                          },
                        ),
                        title: Text('${note.title}'),
                        subtitle: Text('${note.desc}'),
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                      );
                    },
                  ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_DATA);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
