import 'dart:io';

import 'package:avishkar/utils/app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpApis{

  static var user = FirebaseAuth.instance.currentUser;

  static  String signupCollection = 'users';

  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(signupCollection);

  // Store the signup data into the firebase...
  static createUserWithEmailAndPassword({required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = FirebaseAuth.instance.currentUser;
      return true;  
    }catch (e) {
      return false;
    }
  }

  static addUsarData({required String email, required String password,required String name, required String phone, required String username}) async{
    await usersCollection.doc(user!.uid).set({
        'username': username,
        'email': email,
        'phone': phone,
        'name': name,
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
      const SnackBar(content: Text("Something is wrong"),);
    }
  }

  // Method for the signout the user.
  static Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
    exit(0);
  }
}