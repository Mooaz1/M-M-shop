import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/core/model/product_model.dart';

import '../../utlis/constants.dart';
import '../../viewmodel/home_viewmodel.dart';

class CustomFavButton extends StatelessWidget {
  const CustomFavButton({
    Key? key,
    required this.controller,
    required this.index,
    required this.list,
    required this.name
  }) : super(key: key);

  final int index;
  final HomeViewModel controller;
  final String name;
  final ProductModel list;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {
        controller.saveProduct(index,list);
         Get.snackbar("Added to favorite","the item ${name} has been added to favorite",colorText: Colors.white,backgroundColor: Colors.green,);
      }),
      icon: Icon(
        Icons.favorite_border,
      ),
      color: primaryColor,
    );
  }
}
