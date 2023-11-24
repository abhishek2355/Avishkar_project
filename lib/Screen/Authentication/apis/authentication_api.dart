import 'package:avishkar/Screen/Pages/Home/_widget/admin_home_page.dart';
import 'package:avishkar/Screen/Pages/Home/_widget/judge_home_page.dart';
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
  // Judge Login collection
  static String judgeSigninCollection = 'judge_login';
  // Super Admin collection.
  static String superAdminSignInCollection = 'super_admin';

  // Login Signup.
  static bool issueForSignup = false;
  // User Registration collection.
  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(signupCollection);
  // Admin Registration collection
  static final CollectionReference adminCollection = FirebaseFirestore.instance.collection(adminSignupCollection);
  // User Registration collection.
  static final CollectionReference judgeCollection = FirebaseFirestore.instance.collection(judgeSigninCollection);
  // Admin Registration collection
  static final CollectionReference superAdminCollection = FirebaseFirestore.instance.collection(superAdminSignInCollection);
  static String res = "";

  // Store the signup data into the firebase.
  static createUserWithEmailAndPassword({required String email, required String password, required BuildContext context}) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return false;
    }catch (e) {
      return true;
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
  static Future<bool> signInWithEmailAndPassword({required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return false;
    }catch(error){
      return true;
    }
  }
  
  // Method for the Admin signup.
  static Future<bool> signInWithEmailAndPasswordAdmin({required String email, required String password, required BuildContext context}) async{
    try {
      final QuerySnapshot querySnapshot = await adminCollection.where('email', isEqualTo: email).where('password', isEqualTo: password).get();
      if(querySnapshot.docs.isNotEmpty){
        if(context.mounted){
          querySnapshot.docs.forEach((doc) {
            String adminId = doc.id;
            res = adminId.substring(adminId.indexOf('_')+1, adminId.length);
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminHomePage(),),);
        }
        return false;   
      }
      else{
        return true;
      }
      
    }catch(error){
      return true;
    }
  }

  // Method for the Judge signIn.
  static Future<bool> signInWithEmailAndPasswordJudge({required String email, required String password, required BuildContext context}) async{
    try {
      final QuerySnapshot querySnapshot = await judgeCollection.where('email', isEqualTo: email).where('password', isEqualTo: password).get();
      if(querySnapshot.docs.isNotEmpty){
        if(context.mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const JudgeHomePage(),),);
        }
        return false;
      }      
      else{
        return true;
      }
    }catch(error){
      return true;
    }
  }

  // Method for the supar Admin signIn.
  static Future<bool> signInWithEmailAndPasswordSuperAdmin({required String email, required String password, required BuildContext context}) async{
    try {
      final QuerySnapshot querySnapshot = await superAdminCollection.where('email', isEqualTo: email).get();
      if(querySnapshot.docs.isNotEmpty){
        if(context.mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminHomePage(),),);
        }
        return false;
      }      
      else{
        return true;
      }
    }catch(error){
      return true;
    }
  }
}