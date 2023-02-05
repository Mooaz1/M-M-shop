import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/utlis/animation/fade_animation.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/screens/details_screens/product_details_view.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import 'package:mandmshop/viewmodel/home_viewmodel.dart';
import 'package:sizer/sizer.dart';

class DeliveryView extends GetWidget<HomeViewModel> {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
          backgroundColor: Colors.white,
          body: controller.favorite.length == 0
              ? FadeAnimation(
                  .5,
                  child: Center(
                    child: CustomText(
                      text: "Favorite is Empty",
                      fontsize: 25,
                      color: primaryColor,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                        flex: 10,
                        child: ListView.separated(
                            itemBuilder: ((context, index) {
                              return FadeAnimation(
                                index / 2,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(ProductDetailsView(model: controller.favorite[index], index: index));
                                  },
                                  child: Dismissible(
                                      background: Container(
                                          color: Colors.red,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              CustomText(
                                                  maxLinesOne: 1,
                                                  text: controller
                                                      .favorite[index].name,
                                                  color: Colors.white,
                                                  fontsize: 20),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Icon(
                                                Icons.highlight_remove_sharp,
                                                color: Colors.white,
                                              ),
                                            ],
                                          )),
                                      onDismissed: (direction) {
                                        controller.detleDataFromFavorite(index);
                                        controller.favorite.removeAt(index);
                                      },
                                      key: Key(controller.favorite[index].id
                                          .toString()),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ProductImage(
                                            index: index,
                                            controller: controller,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          ProductDetails(
                                            controller: controller,
                                            index: index,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          //on dissmissed hint arrow 
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 7.h,
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.arrow_back_ios_new,
                                                    color: primaryColor,
                                                  )),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              );
                            }),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 15,
                                ),
                            itemCount: controller.favorite.length)),
                  ],
                )),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    required this.controller,
    required this.index,
    Key? key,
  }) : super(key: key);
  final HomeViewModel controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.start,
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Container(
            width: 50.w,
            child: CustomText(
              text: controller
                  .favorite[index].name,
              fontsize: 20,
              maxLinesOne: 1,
              color: primaryColor,
            )),
        SizedBox(
          height: 2.h,
        ),
        Container(
            width: 50.w,
            child: CustomText(
                maxLinesOne: 3,
                text: controller
                    .favorite[index]
                    .description,
                color: primaryColor,
                fontsize: 15)),
        SizedBox(
          height: 3.h,
        ),
        CustomText(
            text:
                "${controller.favorite[index].price} EGP",
            color: primaryColor,
            fontsize: 15),
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage(
      {required this.index, required this.controller, super.key});
  final HomeViewModel controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 30.w,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:
                  NetworkImage(controller.favorite[index].image.toString()))),
    );
  }
}
