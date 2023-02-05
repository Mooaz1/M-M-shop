import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mandmshop/core/model/cart_model.dart';
import 'package:mandmshop/core/model/product_model.dart';

import '../core/services/firestore_services/app_services.dart';


class CartViewModel extends GetxController {
  List<CartModel> cart = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCart();
  }

  getCart() async {
    cart = [];
    try {
      await AppServices().getCartSnapShot().then((snapShot) {
        print("////////////////////////////////////");
        for (var i = 0; i < snapShot.length; i++) {
          cart.add(
              CartModel.fromJson(snapShot[i].data() as Map<dynamic, dynamic>));
        }
        print("cart          ${cart[0].name}");
        getCartTotalPrice();
      });
    } catch (e) {}

    update();
  }

  void addCart(int index, ProductModel model, CartModel cartModel) async {
    cart = [];
    await AppServices().addItemToCartInFirestore(
        ProductModel(
            name: model.name,
            description: model.description,
            price: model.price,
            image: model.image,
            size: model.size,
            id: model.id,
            discount: model.discount,
            color: model.color,
            category: model.category,
            trend: model.trend),
        CartModel(
            name: cartModel.name,
            price: cartModel.price,
            image: cartModel.image,
            quantity: cartModel.quantity,
            id: cartModel.id));
           
    getCart();
    update();
  }

  void incCartItemQuntity(CartModel model, index) async {
    int number = int.parse(cart[index].quantity!) + 1;
    await AppServices().updateCartSnapShot(model, number);
    getCart();
    update();
  }

  void decCartItemQuntity(CartModel model, index) async {
    int number = int.parse(cart[index].quantity!) - 1;
    if (number == 0) {
      deleteItemFromCart(model);
    } else {
      await AppServices().updateCartSnapShot(model, number);
      getCart();
      update();
    }
  }

  void deleteItemFromCart(CartModel cartModel) async {
    try {
      await AppServices().deleteItemFromCart(cartModel);
      getCart();

      update();
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  double totalPrice = 0;
  void getCartTotalPrice() {
    totalPrice = 0;
    for (var i = 0; i < cart.length; i++) {
      totalPrice +=
          double.parse(cart[i].quantity!) * double.parse(cart[i].price!);

      print(totalPrice);
      update();
    }
  }
}
