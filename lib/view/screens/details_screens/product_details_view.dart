import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mandmshop/core/model/cart_model.dart';
import 'package:mandmshop/core/model/product_model.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';
import 'package:mandmshop/view/widgets/custom_button.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import 'package:mandmshop/viewmodel/cart_viewmodel.dart';
import 'package:mandmshop/viewmodel/home_viewmodel.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_fav_button.dart';

class ProductDetailsView extends StatelessWidget {
   ProductDetailsView({required this.model,required this.index, super.key});
  final ProductModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        appBar: CustomAppbar(leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: Icon(
                Icons.arrow_back,
                color: primaryColor,
              )),
       actions: [
        CustomFavButton(
          list: model
          ,
          name: model.name!,
          index: index,controller: controller,)
       ],),
        body: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.network(
                  "${model.image}",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        CustomText(
                          color: Colors.black,
                          text: model.name,
                          fontsize: 26,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: primaryColor,
                                  )),
                              child: Row(
                                children: [
                                  CustomText(
                                    color: Colors.black,
                                    text: 'Size',
                                    fontsize: 25,
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: CustomText(
                                      color: Colors.black,
                                      fontsize: 20,
                                      text: model.size,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: primaryColor,
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    color: Colors.black,
                                    fontsize: 20,
                                    text: 'Color',
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: HexColor(model.color!),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          alignment: Alignment.topLeft,
                          color: Colors.black,
                          text: 'Details',
                          fontsize: 25,
                          maxLinesOne: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: model.description,
                          fontsize: 18,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: "PRICE ",
                          fontsize: 22,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        CustomText(
                          text: ' \$' + model.price!,
                          color: primaryColor,
                          fontsize: 18,
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 180,
                      height: 100,
                      child: GetBuilder<CartViewModel>(
                        init: CartViewModel(),
                        builder:(controller) =>  CustomButton(
                          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          onPressed: () {
                            controller.addCart(index, model,CartModel(
                              name: model.name,
                              image: model.image,
                              quantity: "1",
                              price: model.price,
                              id: model.id


                            ));
                             Get.snackbar("Added to Cart","the item ${model.name} has been added to cart",colorText: Colors.white,backgroundColor: Colors.green,);
                          },
                          text: 'Add to Cart',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

