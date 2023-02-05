// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/animation.dart';

import 'package:mandmshop/utlis/extenstions/hex_extension.dart';

class ProductModel {
  String? name;
  String? price;
  String? image;
  String? size;
  String? id;
  String? discount;
  String? description;
  String? color;
  String? category;
  String ? trend;
  ProductModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.size,
      required this.id,
      required this.discount,
      required this.color,
      required this.category,
      required this.trend
     });

  ProductModel.fromJson(Map<dynamic, dynamic> product) {
    if (product == null) {
      return;
    }
    id = product['id'];
    discount = product['discount'];
    name = product['name'];
    description = product['description'];
    price = product['price'];
    image = product['image'];
    size = product['size'];
    color = product['color'];
    category=product['category'];
    trend=product["trend"];
  }
  toJson() {
    return {
      "name": name,
      "id": id,
      "discount": discount,
      "description": description,
      "price": price,
      "image": image,
      "size": size,
      "color":color,
      "category":category,
      "trend":trend
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
