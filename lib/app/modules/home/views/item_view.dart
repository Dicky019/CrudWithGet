import 'package:c_r_u_d_get_x/app/modules/home/controllers/home_controller.dart';
import 'package:c_r_u_d_get_x/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ItemView extends GetView<HomeController> {
  final data;
  ItemView({required this.data});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()=>Get.toNamed(Routes.EDIT,arguments: data.id,),
      leading: CircleAvatar(),
      title: Text(data.name!),
      subtitle: Text(data.createdAd!),
      trailing: IconButton(onPressed: () {controller.delete(data.id);}, icon: Icon(Icons.delete)),
    );
  }
}
