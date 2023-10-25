import 'package:avishkar/Screen/Pages/Home/_widget/admin_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpApis{
  // Current user.
  static var user = FirebaseAuth.instance.currentUser;
  // Collection name.
  static  String signupCollection = 'users';
  // Admin Login collection
  static String adminSignupCollection = 'admin_login';
  // Login issue.
  static bool issueForLogin = false;
  // Login Signup.
  static bool issueForSignup = false;
  // User Registration collection.
  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(signupCollection);
// Admin Registration collection
  static final CollectionReference adminCollection = FirebaseFirestore.instance.collection(adminSignupCollection);

  // Store the signup data into the firebase.
  static createUserWithEmailAndPassword({required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }catch (e) {
      issueForSignup = true;
    }
  }

  // Added user information to the database.
  static addUsarData({required String email, required String password, required String phone, required String username}) async{
    await usersCollection.doc(user!.uid).set({
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    });
  }

  // Method for the login user. 
  static Future<void> signInWithEmailAndPassword({required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }catch(error){
      issueForLogin = true;
    }
  }
  
  // Method for the Admin signup.
  static Future<void> signInWithEmailAndPasswordAdmin({required String email, required String password, required BuildContext context}) async{
    try {
      final QuerySnapshot querySnapshot = await adminCollection.where('email', isEqualTo: email).get();
      if(querySnapshot.docs.isNotEmpty){
        if(context.mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminHomePage(),),);
        }
      }      
    }catch(error){
      issueForLogin = true;
    }
  }

  // Method for the signout the user.
  static Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
  }
}