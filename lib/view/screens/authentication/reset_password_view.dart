import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/screens/authentication/login_view.dart';
import 'package:mandmshop/view/widgets/Custom_Form.dart';
import 'package:mandmshop/view/widgets/custom_appbar.dart';
import 'package:mandmshop/view/widgets/custom_button.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import 'package:mandmshop/viewmodel/auth_viewmodel.dart';

import 'package:sizer/sizer.dart';

import '../../../utlis/animation/fade_animation.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          leading: IconButton(
              onPressed: (() {
                Get.to(LoginView());
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
                  SizedBox(height: 15.h),
                  FadeAnimation(
                    1,
                    child: CustomText(
                      text: "Reset Password",
                      color: primaryColor,
                      fontsize: 30,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
                      hintText: "Enter your recovery email",
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
                                controller.resetPasswordViaEmail(
                                    emailController.text.trim());
                              }
                            }),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                            text: "Reset password",
                            fontSize: 30),
                      ),
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
