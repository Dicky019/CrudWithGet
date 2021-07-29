import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  //TODO: Implement AddController
  late TextEditingController name;
  @override
  void onInit() {
    name = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
  }
}
