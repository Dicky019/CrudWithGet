import 'package:c_r_u_d_get_x/app/data/providers/product_provider.dart';
import 'package:c_r_u_d_get_x/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import './item_view.dart';

class HomeView extends GetView<HomeController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            splashRadius: 26,
            onPressed: () => Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
            icon: Icon(Icons.color_lens_outlined),
          ),
          // IconButton(
          //   splashRadius: 26,
          //   onPressed: controller.tessdata,
          //   icon: Icon(Icons.remove_red_eye_outlined),
          // ),
        ],
      ),
      body: Obx(
        () => controller.products.isEmpty
            ? Center(
                child: Text("Belum ada data.."),
              )
            : ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, i) {
                  final data = controller.products[i];
                  return ItemView(data: data);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD),
        child: Icon(Icons.add),
      ),
    );
  }
}
