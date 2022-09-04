import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:penerapan_sqflite/app/data/models/note_model.dart';
import 'package:penerapan_sqflite/app/modules/home/controllers/home_controller.dart';

import '../controllers/edit_data_controller.dart';

class EditDataView extends GetView<EditDataController> {
  Note note = Get.arguments;
  final HomeController homeC = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.titleC.text = note.title!;
    controller.descC.text = note.desc!;
    return Scaffold(
      appBar: AppBar(
        title: Text('EditDataView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.titleC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller.descC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() => ElevatedButton(
                onPressed: () async {
                  if (controller.isLoading.isFalse) {
                    controller.editData(note.id!);
                    await homeC.getAllnotes();
                    Get.back();
                  }
                },
                child: Text(
                    controller.isLoading.isFalse ? 'Ubah Data' : 'Loading...'),
              )),
        ],
      ),
    );
  }
}
