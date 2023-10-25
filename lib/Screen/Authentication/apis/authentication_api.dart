// import 'package:avishkar/Screen/Pages/admin_home.dart';
import 'dart:io';
import 'package:avishkar/Screen/Pages/Home/_widget/admin_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpApis{

  static var user = FirebaseAuth.instance.currentUser;
  static  String signupCollection = 'users';
  static bool issue_for_login = false;
  static bool issue_for_signup = false;

  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(signupCollection);

  // Store the signup data into the firebase...
  static createUserWithEmailAndPassword({required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = FirebaseAuth.instance.currentUser;
    }catch (e) {
      issue_for_signup = true;
    }
  }

  static addUsarData({required String email, required String password, required String phone, required String username}) async{
    await usersCollection.doc(user!.uid).set({
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    });
  }

  // Method for the login user... 
  static Future<void> signInWithEmailAndPassword({required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }catch(error){
      issue_for_login = true;
    }
  }

  static Future<void> signInWithEmailAndPasswordAdmin({required String email, required String password, required BuildContext context}) async{
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('admin_login') // Replace with your actual collection name
        .where('email', isEqualTo: email)
        .get();
      if(querySnapshot.docs.isNotEmpty){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminHomePage(),),);
      }      
    }catch(error){
      issue_for_login = true;
    }
  }

  // Method for the signout the user.
  static Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
    exit(0);
  }
}