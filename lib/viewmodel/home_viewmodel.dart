import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/core/model/category_model.dart';
import 'package:mandmshop/core/model/product_model.dart';
import 'package:mandmshop/core/model/user_model.dart';
import 'package:mandmshop/view/screens/home/cart_view.dart';
import 'package:mandmshop/view/screens/home/favorite_view.dart';
import 'package:mandmshop/view/screens/home/home.dart';
import 'package:mandmshop/viewmodel/auth_viewmodel.dart';
import 'package:mandmshop/viewmodel/cart_viewmodel.dart';

import '../core/services/firestore_services/app_services.dart';

class HomeViewModel extends GetxController {
 
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
    getProducts();
    getFavorite();
    getSuggestion();
    
  }

  List offers = [
    "https://media.istockphoto.com/id/900008970/vector/end-of-winter-sale-background-discount-coupon-template-vector-illustration.jpg?s=1024x1024&w=is&k=20&c=n67_R-1H71XLYxG0yyrXupgb1tQVdgtUJFjowOfR05k=",
    "https://media.istockphoto.com/id/1285336613/vector/christmas-price-tag-banner-xmas-sparkling-lights-garland-with-gifts-box-holidays-background.jpg?s=1024x1024&w=is&k=20&c=2KKFhJSVXWCyhfc7GqFcv45pwoxlq4lJULwlfyei60A=",
    "https://media.istockphoto.com/id/1394056736/vector/mega-sale-special-offer-neon-30-off-sale-banner-sign-board-promotion-vector.jpg?s=1024x1024&w=is&k=20&c=aFhk81EL17r2wLdwIGubLDfvdoi6VirhhG6ePk4VIlI=",
    "https://media.istockphoto.com/id/1270641176/photo/portrait-of-young-woman-in-neon-light-on-dark-backgound-the-human-emotions-black-friday-cyber.jpg?s=1024x1024&w=is&k=20&c=dNqJ1Dvm7OLExd812casbeHC0LGJUa_XlIPXNMwO10k="
  ];

  final List<CategoryModel> category = [];

  getCategory() async {
    await AppServices().getCategorySnapShot().then((snapShot) {
      for (var i = 0; i < snapShot.length; i++) {
        category.add(CategoryModel.fromJson(
            snapShot[i].data() as Map<dynamic, dynamic>));
      }

      update();
    });
  }

  final List<ProductModel> products = [];
  final List<ProductModel>? men = [];
  final List<ProductModel>? women = [];
  final List<ProductModel>? kids = [];
  final List<ProductModel>? laptops = [];
  final List<ProductModel>? tv = [];
  final List categories = [];
  List<ProductModel> suggestions=[];
  final List<ProductModel> trends=[];
  final List<String> categoriesName=[
    "TV",
    "Laptops",
    "Women",
    "Kids",
    "Men"
  ];
   

  getSuggestion()async{
    await AppServices().getProductsSnapShot().then((snapShot){
       for (var i = 0; i < snapShot.length; i++) {
        suggestions.add(
            ProductModel.fromJson(snapShot[i].data() as Map<dynamic, dynamic>));
      }
    });
  }

  getProducts() async {
    await AppServices().getProductsSnapShot().then((snapShot) {
      for (var i = 0; i < snapShot.length; i++) {
        products.add(
            ProductModel.fromJson(snapShot[i].data() as Map<dynamic, dynamic>));
      }
    });
    products.forEach((element) {
      if (element.trend=="1") {
trends.add(element);
        
      } 
    });
    
    products.forEach(
      (element) {
        if (element.category == "men") {
          men!.add(element);
        } else if (element.category == "tv") {
          tv!.add(element);
        } else if (element.category == "women") {
          women!.add(element);
        } else if (element.category == "kid") {
          kids!.add(element);
        } else if (element.category == "laptop") {
          laptops!.add(element);
        }
      },
    );
    categories.add(tv);
    categories.add(laptops);
    categories.add(women);
    categories.add(kids);
    categories.add(men);
    

    print(men!.isEmpty ? "men" : men![0].name);
    print(women!.isEmpty ? "women" : women![0].name);
    print(kids!.isEmpty ? "kids" : kids![0].name);
    print(laptops!.isEmpty ? "laptops" : laptops![0].name);
    print(tv!.isEmpty ? "tv" : tv![0].name);
    update();
  }

  List<ProductModel> favorite = [];

  getFavorite() async {
    favorite = [];
    try {
      await AppServices().getFavoriteSnapShot().then((snapShot) {
        print("////////////////////////////////////");
        for (var i = 0; i < snapShot.length; i++) {
          favorite.add(ProductModel.fromJson(
              snapShot[i].data() as Map<dynamic, dynamic>));
        }
        print("favoirte          ${favorite[0].id}");
      });
    } catch (e) {}

    update();
  }

  void saveProduct(int index,ProductModel model) async {
    favorite=[];
    await AppServices().addFavoriteToFirestore(ProductModel(
        name: model.name,
        description: model.description,
        price: model.price,
        image: model.image,
        size: model.size,
        id: model.id,
        discount: model.discount,
        color: model.color,
        category: model.category,
        trend: model.trend));
    getFavorite();
    update();
  }
 
  var index = 0.obs;
  void changeIndex(value) {
    index.value = value;
    update();
  }

  Widget pageController(int value) {
    switch (value) {
      case 0:
        return HomeView();
      case 1:
        return DeliveryView();
      default:
        return CartView();
    }
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  String? uid;
  Future<void> detleDataFromFavorite(int index) async {
    User? user = auth.currentUser;
    uid = user!.uid;

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Favorite")
        .doc(favorite[index].id)
        .delete();
    getFavorite();
    update();
  }

  int categoryIndex = 0;
  void changeCategoryIndex(int index) {
    categoryIndex = index;
    update();
  }
  
  void searchProduct(String query){
    final suggestion=products.where((product){
      final producttile=product.name!.toLowerCase();
      final input=query.toLowerCase();
      return producttile.contains(input);

    }).toList();
    suggestions=suggestion;
    update();

  }
}
