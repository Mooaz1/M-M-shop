// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/animation.dart';

import 'package:mandmshop/utlis/extenstions/hex_extension.dart';

class CartModel {
  String ? id;
  String? name;
  String? price;
  String? image;
  String ? quantity;
  CartModel(
      {required this.name,
      required this.id,
      required this.price,
      required this.image,
      required this.quantity,
     });

  CartModel.fromJson(Map<dynamic, dynamic> cart) {
    if (cart == null) {
      return;
    }
    id=cart['id'];
    name = cart['name'];
    price = cart['price'];
    image = cart['image'];
    quantity=cart["quantity"];
  }
  toJson() {
    return {
      "id":id,
      "name": name,
      "quantity": quantity,
      "price": price,
      "image": image,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
