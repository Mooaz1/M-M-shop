import 'package:flutter/material.dart';
import 'package:mandmshop/view/widgets/custom_fav_button.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import '../../utlis/constants.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView(
      {required this.onTap,
      required this.image,
      required this.name,
      required this.price,
      required this.discount,
      required this.Fav,
      super.key});
  final void Function()? onTap;
  final String image;
  final String name;
  final String price;
  final String discount;
  final Widget Fav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: primaryColor)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.fill)),
                ),
                CustomText(
                  text: name,
                  color: primaryColor,
                  fontsize: 25,
                  maxLinesOne: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      alignment: Alignment.topLeft,
                      text: "${price} EGP",
                      color: primaryColor,
                      fontsize: 20,
                      maxLinesOne: 1,
                    ),
                    Spacer(),
                    CustomText(
                        text: "${discount}%",
                        color: primaryColor,
                        fontsize: 20),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Fav,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
