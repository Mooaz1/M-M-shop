import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mandmshop/core/model/cart_model.dart';
import 'package:mandmshop/core/model/product_model.dart';
import 'package:mandmshop/core/model/user_model.dart';
import 'package:mandmshop/viewmodel/auth_viewmodel.dart';
import 'package:mandmshop/viewmodel/home_viewmodel.dart';

class AppServices {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection('Users');
  AuthViewModel authViewModel = AuthViewModel();
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  String? uid;
  /* final User? user = auth.currentUser;
         final uid = user!.uid;*/

  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _userCollectionReference
        .doc(userModel.uid)
        .set(userModel.tojson())
        .then((value) {
      print("user added******* ");
    }).catchError((onError) {
      print("ssssssssssssssssssssssssssssssss    " + onError.toString());
    });
  }

  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection("Category");

  Future<List<QueryDocumentSnapshot>> getCategorySnapShot() async {
    var snapShot = await _categoryCollectionReference.get();
    return snapShot.docs;
  }

  final CollectionReference categoryCollectionReference =
      FirebaseFirestore.instance.collection("Products");
  Future<List<QueryDocumentSnapshot>> getProductsSnapShot() async {
    var snapShot = await categoryCollectionReference.get();
    return snapShot.docs;
  }

  Future<void> addFavoriteToFirestore(ProductModel productModel) async {
    User? user = auth.currentUser;
    uid = user!.uid;
    return await _userCollectionReference
        .doc(uid)
        .collection("Favorite")
        .doc(productModel.id)
        .set(productModel.toJson())
        .then((value) {
      print("user added******* ");
    }).catchError((onError) {
      print("ssssssssssssssssssssssssssssssss    " + onError.toString());
    });
  }

  Future<List<QueryDocumentSnapshot>> getFavoriteSnapShot() async {
    User? user = auth.currentUser;
    uid = user!.uid;

    try {
      var snapShot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Favorite")
          .get();

      print(
          "**************************************************************************** ${snapShot.docs}");
      return snapShot.docs;
    } on FirebaseException catch (e) {
      return [];
    }
  }

  HomeViewModel controller = HomeViewModel();
  Future<void> detleDataFromFavorite(int index) async {
    User? user = auth.currentUser;
    uid = user!.uid;

    // await FirebaseFirestore.instance
    //     .collection("Users")
    //     .doc(uid)
    //     .collection("Favorite")
    //     .doc(controller.favorite[index].id)
    //     .delete();
  }
  // final CollectionReference _trendsCollectionReference =
  //     FirebaseFirestore.instance.collection("Trends");

  // Future<List<QueryDocumentSnapshot>> getTrendsSnapShot() async {
  //   var snapShot = await _trendsCollectionReference.get();
  //   return snapShot.docs;
  // }

  Future<void> addItemToCartInFirestore(
      ProductModel productModel, CartModel cartModel) async {
    User? user = auth.currentUser;
    uid = user!.uid;
    return await _userCollectionReference
        .doc(uid)
        .collection("Cart")
        .doc(productModel.id)
        .set(cartModel.toJson())
        .then((value) {
      print("item added******* ");
    }).catchError((onError) {
      print("ssssssssssssssssssssssssssssssss    " + onError.toString());
    });
  }

  Future<List<QueryDocumentSnapshot>> getCartSnapShot() async {
    User? user = auth.currentUser;
    uid = user!.uid;

    try {
      var snapShot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Cart")
          .get();

      print(
          "**************************************************************************** ${snapShot.docs}");
      return snapShot.docs;
    } on FirebaseException catch (e) {
      return [];
    }
  }

  Future<void> updateCartSnapShot(CartModel model, number) async {
    User? user = auth.currentUser;
    uid = user!.uid;

    try {
      var snapShot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Cart")
          .doc(model.id)
          .update({"quantity": "$number"});

      print(
          "**************************************************************************** ");
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteItemFromCart(CartModel model) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? uid = user!.uid;

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Cart")
        .doc(model.id)
        .delete();
  }
}
