import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/utlis/animation/fade_animation.dart';
import 'package:mandmshop/view/screens/authentication/reset_password_view.dart';
import 'package:mandmshop/view/screens/authentication/signup_view.dart';
import 'package:mandmshop/view/widgets/Custom_Form.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';
import 'package:mandmshop/view/widgets/custom_button.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import 'package:mandmshop/viewmodel/auth_viewmodel.dart';

import 'package:sizer/sizer.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          leading: IconButton(
              onPressed: (() {
                Get.to(SignUpView());
              }),
              icon: Icon(
                Icons.arrow_back,
                color: primaryColor,
              )),
          actions: []),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: 100.w,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  FadeAnimation(
                    1,
                    child: CustomText(
                      text: "LogIn",
                      color: primaryColor,
                      fontsize: 30,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  FadeAnimation(1.3,
                      child: Stack(
                        children: [
                          Container(
                            height: 21.h,
                            width: 70.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/gif/shop.gif'),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            top: 80,
                            left: 130,
                            child: Row(
                              children: [
                                Text(
                                  "M",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                CustomText(
                                    text: "&",
                                    color: primaryColor,
                                    fontsize: 20),
                                Text(
                                  "M",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  FadeAnimation(
                    1.5,
                    child: CustomTextForm(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email,
                        color: primaryColor,
                      ),
                      labelText: "Email",
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  FadeAnimation(
                    1.6,
                    child: CustomTextForm(
                      validator: (value) {
                        if (value!.length < 8) {
                          return "Passwrod must be more than 8 charachers";
                        }
                        return null;
                      },
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: primaryColor,
                      ),
                      isObsecure: true,
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GetBuilder<AuthViewModel>(
                    init: AuthViewModel(),
                    builder: (controller) => FadeAnimation(
                      1.8,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: CustomButton(
                            onPressed: (() {
                              if (formKey.currentState!.validate()) {
                                controller.signInWithEmailAndPassword(
                                    emailController.text.trim(),
                                    passwordController.text.trim());
                              }
                            }),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                            text: "Login",
                            fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  FadeAnimation(
                    1.9,
                    child: Row(
                      children: [
                        CustomText(
                            alignment: Alignment.topLeft,
                            text: "Forget your password ?",
                            color: Colors.black,
                            fontsize: 15),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: TextButton(
                            onPressed: () {
                              Get.to(ResetPasswordView());
                            },
                            child: CustomText(
                                text: "Reset password ",
                                color: primaryColor,
                                fontsize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
