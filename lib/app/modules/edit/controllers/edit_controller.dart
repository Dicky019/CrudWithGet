import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  //TODO: Implement EditController
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
