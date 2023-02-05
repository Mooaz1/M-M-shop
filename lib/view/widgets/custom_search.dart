import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utlis/constants.dart';
import '../screens/home/search_view.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    required this.onTap,
    required this.onChanged,
    required this.controller,
    Key? key,
  }) : super(key: key);
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController ?controller;
   

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: primaryColor)),
      child: TextFormField(
        controller:controller ,
        onTap:onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Search",
            labelStyle: TextStyle(color: primaryColor),
            prefixIcon: Icon(
              Icons.search,
              color: primaryColor,
            )),
      ),
    );
  }
}