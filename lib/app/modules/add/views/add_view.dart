import 'package:c_r_u_d_get_x/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  final homeC = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
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
                  homeC.add(controller.name.text),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () =>
                  homeC.add(controller.name.text),
              child: Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }
}
