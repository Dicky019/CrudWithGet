import 'package:c_r_u_d_get_x/app/modules/edit/controllers/edit_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'package:c_r_u_d_get_x/app/modules/home/controllers/home_controller.dart';


class EditView extends GetView<EditController> {
  final homeC = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final data = homeC.findById(Get.arguments);
    controller.name.text = data.name!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: controller.name,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Product Name",
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () =>
                  homeC.edit(Get.arguments,controller.name.text),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () =>
                   homeC.edit(Get.arguments,controller.name.text),
              child: Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }
}
