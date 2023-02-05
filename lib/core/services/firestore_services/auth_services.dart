
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mandmshop/view/screens/home/home.dart';

class AuthServices{
  FirebaseAuth _auth=FirebaseAuth.instance;
  GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);
  FirebaseAuth get auth=>_auth;
  Future<UserCredential> createAccountWithEmailAndPassword(String email,String password)async{
   return await   _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  Future<UserCredential> createAccountWithGoogle()async{
   final GoogleSignInAccount? googleSignInAccount=await _googleSignIn.signIn();
   final GoogleSignInAuthentication signInAuthentication= await googleSignInAccount!.authentication;
  UserCredential userCredential= await _auth.signInWithCredential(GoogleAuthProvider.credential(
    idToken: signInAuthentication.idToken,
    accessToken: signInAuthentication.accessToken
   ));
   return userCredential;
   print(userCredential.user);

  }
  Future<UserCredential> signinwithEmailAndPassword(String email,String password)async{
   return await _auth.signInWithEmailAndPassword(email: email, password: password);

  }
  Future<void> resetPasswordViaEmail(String email)async{
    await _auth.sendPasswordResetEmail(email: email);

  }
  
}