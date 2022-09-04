import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:penerapan_sqflite/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_data_controller.dart';

class AddDataView extends GetView<AddDataController> {
  final HomeController homeC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AddDataView'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.titleC,
              decoration: InputDecoration(
                hintText: 'Masukkan Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.descC,
              decoration: InputDecoration(
                hintText: 'Masukkan Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => ElevatedButton(
                  onPressed: () async {
                    if (controller.isLoading.isFalse) {
                      controller.addNote();
                      homeC.getAllnotes();
                      Get.back();
                    }
                  },
                  child: Text(controller.isLoading.isFalse
                      ? 'Submit Data'
                      : 'Loading...'),
                ))
          ],
        ));
  }
}
