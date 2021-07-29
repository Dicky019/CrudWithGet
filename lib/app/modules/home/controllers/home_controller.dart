import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../../data/providers/product_provider.dart';

class HomeController extends GetxController {

  var products = List<Product>.empty().obs;

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  void add(String name) {
    if (name != "") {
      final date = DateTime.now().toIso8601String();
      ProductProvider().postProduct(name, date).then((response) {
        // print(response["name"]);
        final data = Product(
          id: response["name"],
          name: name,
          createdAd: date,
        );
        products.add(data);
        Get.back();
      });
    } else {
      dialogError("Tidak Boleh Kosong");
    }
  }

  void delete(String id) {
    ProductProvider()
        .deleteProduct(id)
        .then((value) => products.removeWhere((element) => element.id == id));
  }

  Product findById(String id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name) {
    ProductProvider().editProduct(id, name).then((_) {
      final data = findById(id);
      data.name = name;
      products.refresh();
      Get.back();
    });
  }

  Future<Map<String, dynamic>> getProducts() async {
    final response =
        await ProductProvider().get('${ProductProvider().url}products.json');
    final data = response.body as Map<String, dynamic>;
    data.forEach((key, value) {
    //  Datetime date = DateFormat().parse(value['createdAt']);
      final data = Product(
        id: key,
        name: value['name'],
        createdAd: value['createdAt'],
      );
      products.add(data);
    });

    return data;
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
