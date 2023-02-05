import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mandmshop/core/model/user_model.dart';
import 'package:mandmshop/view/screens/payment_screens/toggle_screen.dart';
import 'package:mandmshop/view/widgets/Custom_Form.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';
import 'package:mandmshop/view/widgets/custom_button.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import 'package:mandmshop/viewmodel/auth_viewmodel.dart';
import 'package:mandmshop/viewmodel/cart_viewmodel.dart';
import 'package:mandmshop/viewmodel/paymnet_viewmodel.dart';
import 'package:sizer/sizer.dart';
import '../../../utlis/constants.dart';

class PaymentView extends StatelessWidget {
  PaymentView({super.key});
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  //  TextEditingController adressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  double? price;
  AuthViewModel authViewModel = Get.find();
  CartViewModel cartViewModel = Get.find();
 

  @override
  Widget build(BuildContext context) {
    emailController.text = authViewModel.user!;
    price = cartViewModel.totalPrice;
    return GetBuilder<PaymentViewModel>(
      init: PaymentViewModel(),
      builder: (controller) => Scaffold(
        appBar:CustomAppbar(actions: [],leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: Icon(
                Icons.arrow_back,
                color: primaryColor,
              )),),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: 100.w,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextForm(
                     validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a valid name";
                            }
                            return null;
                          },
                      prefixIcon: Icon(
                        Icons.person,
                        color: primaryColor,
                      ),
                      labelText: "First Name",
                      controller: firstnameController),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomTextForm(
                   validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a valid name";
                            }
                            return null;
                          },
                      prefixIcon: Icon(Icons.person, color: primaryColor),
                      labelText: "Last Name",
                      controller: lastnameController),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomTextForm(
                      enabled: false,
                     validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                      prefixIcon: Icon(Icons.phone, color: primaryColor),
                      labelText: "Email",
                      controller: emailController),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomTextForm(
                      validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a valid phone number";
                            }
                            return null;
                          },
                      prefixIcon: Icon(Icons.phone, color: primaryColor),
                      labelText: "Phone number",
                      controller: phoneController),
                  SizedBox(
                    height: 3.h,
                  ),
                  // CustomTextForm(
                  //     validator: (p0) {},
                  //     prefixIcon: Icon(Icons.location_city, color: primaryColor),
                  //     labelText: "Adress",
                  //     controller: adressController),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "Total price",
                                color: primaryColor,
                                fontsize: 25),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomText(
                                text: "${price} EGP",
                                color: primaryColor,
                                fontsize: 25),
                          ],
                        ),
                        Spacer(),
                        CustomButton(
                          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          onPressed: () {
                         if(formKey.currentState!.validate()){
                           controller.getFirstToken(firstnameController.text.trim(),
                            lastnameController.text.trim(),
                             emailController.text.trim(),
                              phoneController.text.trim());
                                Get
                                .to(ToggleView());
                         }
                          },
                          text: 'Checkout',
                          fontSize: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
