import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/screens/payment_screens/payment_view.dart';
import 'package:mandmshop/viewmodel/cart_viewmodel.dart';
import 'package:sizer/sizer.dart';
import '../../../utlis/animation/fade_animation.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class CartView extends StatelessWidget {
   CartView({super.key});
   CartViewModel _cartViewModel=Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: controller.cart.length == 0
            ? FadeAnimation(
                .5,
                child: Center(
                  child: CustomText(
                    text: "Cart is Empty",
                    fontsize: 25,
                    color: primaryColor,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 71.h,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return FadeAnimation(
                              index / 2,
                              child: CartItemBuild(
                                controller: controller,
                                index: index,
                              ),
                            );
                          }),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 4.h,
                              ),
                          itemCount: controller.cart.length),
                    ),
                    CheckoutSection(
                      controller: controller,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class CartItemBuild extends StatelessWidget {
  const CartItemBuild({
    required this.index,
    required this.controller,
    Key? key,
  }) : super(key: key);
  final CartViewModel controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 15.h,
          width: 30.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("${controller.cart[index].image}"),
                  fit: BoxFit.fill)),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          height: 13.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50.w,
                child: CustomText(
                    maxLinesOne: 1,
                    text: "${controller.cart[index].name}",
                    color: primaryColor,
                    fontsize: 25),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomText(
                  text: "${controller.cart[index].price} EGP",
                  color: primaryColor,
                  fontsize: 15),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.incCartItemQuntity(
                            controller.cart[index], index);
                        //print(controller.number);
                      },
                      icon: Icon(
                        Icons.add,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 20,
                      child: Center(
                          child: Text(
                        controller.cart[index].quantity!,
                        style: TextStyle(color: primaryColor),
                      )),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.decCartItemQuntity(
                              controller.cart[index], index);
                          // print(controller.number);
                        },
                        icon: Icon(
                          Icons.remove,
                          color: primaryColor,
                        ))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final CartViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                  text: "Total price", color: primaryColor, fontsize: 20),
              SizedBox(
                height: 15,
              ),
              CustomText(
                  text: "${controller.totalPrice} EGP",
                  color: primaryColor,
                  fontsize: 20),
            ],
          ),
          CustomButton(
            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
            onPressed: () {
              Get.to(PaymentView());
            },
            text: 'Checkout',
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}
