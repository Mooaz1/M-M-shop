import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandmshop/core/model/user_model.dart';
import 'package:mandmshop/view/screens/authentication/login_view.dart';
import 'package:mandmshop/view/screens/authentication/split_view.dart';
import 'package:mandmshop/view/screens/drawer/drawer.dart';
import 'package:mandmshop/view/screens/home/cart_view.dart';
import 'package:mandmshop/view/screens/home/favorite_view.dart';
import 'package:mandmshop/view/screens/home/home.dart';

import '../core/services/firestore_services/app_services.dart';
import '../core/services/firestore_services/auth_services.dart';

class AuthViewModel extends GetxController{
   Rxn<User?> _user = Rxn<User?>();
  String? get user => _user.value?.email;
   AuthServices authServices=AuthServices();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(authServices.auth.authStateChanges());

  }
   String ?uid;
 
  void createAccountWithEmailAndPassword(String email, String password,String name)async{
  try{
      await authServices.createAccountWithEmailAndPassword(email, password).then((user){
        saveUser( email,password, name, user);
        uid=user.user!.uid;
       print(uid );
         Get.to(()=>MyDrawer(),transition: Transition.zoom,duration: Duration(seconds: 2));
         Get.snackbar("Sign up Successfully", "",colorText: Colors.white,backgroundColor: Colors.green,);
      });
      
    }on FirebaseAuthException catch (e){
     Get.snackbar("Sign up faild", e.message.toString(),colorText: Colors.white,backgroundColor: Colors.red,);
    }

  
  }
 void createAccountWithGoogle()async{
    try {
   await   authServices.createAccountWithGoogle().then((user){
    saveUser(user.user!.email.toString(), "google account" ,user.user!.displayName.toString(), user);
     Get.to(()=>MyDrawer(),transition: Transition.zoom,duration: Duration(seconds: 2));
         Get.snackbar("Login succfuly", "",colorText: Colors.white,backgroundColor: Colors.green,);
   });
      
    } on FirebaseAuthException catch (e) {
       Get.snackbar("Login faild", e.message.toString(),colorText: Colors.white,backgroundColor: Colors.red,);
    }
    
  }
  void signInWithEmailAndPassword(String email,String password)async{
    try {
      await authServices.signinwithEmailAndPassword(email, password).then((user){
        uid=user.user!.uid;
      Get.to(()=>MyDrawer(),transition: Transition.zoom,duration: Duration(seconds: 2));
         Get.snackbar("Login succfuly", "",colorText: Colors.white,backgroundColor: Colors.green,);
    });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Login faild", e.message.toString(),colorText: Colors.white,backgroundColor: Colors.red,);
    }
  }
  void resetPasswordViaEmail(String email){
    try {
      authServices.resetPasswordViaEmail(email).then((value){
      Get.to(()=>LoginView());
         Get.snackbar("Reset password successfully", "A password requiest has been sent to your email",colorText: Colors.white,backgroundColor: Colors.green,);
    });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Reset password  faild", e.message.toString(),colorText: Colors.white,backgroundColor: Colors.red,);
    }
    
  }
  void saveUser(String email,String password,String name,UserCredential user)async{
  await AppServices().addUserToFirestore(UserModel(
            name: name,
            email: email,
            password: password,
            picture: "https://firebasestorage.googleapis.com/v0/b/mandmshop-cef62.appspot.com/o/user.png?alt=media&token=d0bf85e6-c748-414a-bb81-1265d23815da",
            phoneNumber: "",
            uid: user.user!.uid));
  }
  
  

}