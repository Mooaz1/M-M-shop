import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/utlis/animation/fade_animation.dart';
import 'package:mandmshop/view/screens/authentication/login_view.dart';
import 'package:mandmshop/view/widgets/Custom_Form.dart';
import 'package:mandmshop/view/widgets/custom_button.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';
import 'package:mandmshop/view/widgets/social_button.dart';
import 'package:mandmshop/viewmodel/auth_viewmodel.dart';


import 'package:sizer/sizer.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = SizerUtil.height;
    final width = SizerUtil.width;
    return  GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder:(controller) =>  Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: width,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height:  10.h),
                      FadeAnimation(
                        1,
                        child: CustomText(
                          text: "Sign Up",
                          color: primaryColor,
                          fontsize: 30,
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      FadeAnimation(
                        1.3,
                        child:  Stack(
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
                      )
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      FadeAnimation(
                        1.4,
                        child: CustomTextForm(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a your name";
                            }
                            return null;
                          },
                          controller: nameController,
                          textInputType: TextInputType.name,
                          prefixIcon: Icon(
                            Icons.person,
                            color: primaryColor,
                          ),
                          labelText: "Person",
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
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
                            if (value!.length<8) {
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
                      SizedBox(height: 2.h,),
                      FadeAnimation(
                        1.8,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5.w),
                          child: CustomButton(onPressed: (() {
                             if(formKey.currentState!.validate()){
                              controller.createAccountWithEmailAndPassword(emailController.text.trim(),
                               passwordController.text.trim(),nameController.text.trim());
                            }
                          }),
                           padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                             text: "SignUp",
                              fontSize: 30),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                     FadeAnimation(
                      1.9,
                       child: Row(
                        children: [
                          CustomText(
                        alignment: Alignment.topLeft,
                        text: "Already have an account ?", color: Colors.black, fontsize: 15),
                        SizedBox(width: 5.w,),
                       GestureDetector(
                        onTap: () {
                          Get.to(LoginView());
                        },
                         child: CustomText(
                         
                          text: "Login now ", color: primaryColor, fontsize: 15),
                       ),
                        ],
                       ),
                     ),
                      SizedBox(height: 2.h,),
                      FadeAnimation(
                        1.8,
                        child: Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 1,
                              color: primaryColor,
                            ),
                            Text("OR"),
                            Container(
                              width: 40.w,
                              height: 1,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.h,),
                      FadeAnimation(
                        1.9,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SocialButton(
                            onPressed: () {
                              controller.createAccountWithGoogle();
                            },
                            assetImage: "assets/images/google.png",
                          ),
                          SocialButton(
                            onPressed: () {
                              
                            },
                            assetImage: "assets/images/facebook.png",
                          )
                            ],
                          ),
                        ),
                      )
          
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
    
  }
}

