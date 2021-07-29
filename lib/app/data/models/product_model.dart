class Product {
  String? id;
  String? name;
  String? createdAd;

  Product({this.id, this.name, this.createdAd});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAd = json['createdAd'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createdAd'] = createdAd;
    return data;
  }
}
