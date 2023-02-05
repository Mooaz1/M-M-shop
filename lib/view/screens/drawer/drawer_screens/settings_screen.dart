import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mandmshop/utlis/constants.dart';
import 'package:mandmshop/view/screens/authentication/signup_view.dart';
import 'package:mandmshop/view/widgets/custom_button.dart';
import 'package:mandmshop/view/widgets/custom_text.dart';

import '../../../widgets/custom_appbar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(leading: IconButton(
              icon:  Icon(Icons.menu,color: primaryColor),
              onPressed: () {
                zoomDrawerController.toggle!();
              },
            ), actions: []),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 150,
                      child: CustomButton(
            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
            onPressed: () {
             FirebaseAuth.instance.signOut();
             Get.to(SignUpView());
             Get.snackbar("Sign out Successfully", "",colorText: Colors.white,backgroundColor: Colors.green,);
            },
            text: 'Sign out',
            fontSize: 20,
          ),
                    ),
                  ],
                ),
              ),
            ),
            
    );
  }
}