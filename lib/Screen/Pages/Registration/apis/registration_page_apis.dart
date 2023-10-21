
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationAPI{
  static const registerCollection = "Register";
  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(registerCollection);
  static var user = FirebaseAuth.instance.currentUser;

  static addRegisterData({
    required saveFname, 
    required saveMname, 
    required saveLname,
    required saveParentName, 
    required saveEmail,
    required saveMobile,
    required saveDOB, 
    required saveAddress,
    required saveDept, 
    required saveCategory, 
    required saveLavel,
    required saveProject,
    required saveMentor,
    required saveAbstract,
    required saveIsModel,
    required context,
    }){
    usersCollection.doc(user!.uid).set({
      "first_name" : saveFname,
      "middle_name" : saveMname,
      "last_name" : saveLname,
      "parent_name" : saveParentName,
      "email" : saveEmail,
      "phone" : saveMobile,
      "date_of_birth" : saveDOB,
      "address" : saveAddress,
      "department" : saveDept,
      "category" : saveCategory,
      "lavel" : saveLavel,
      "project_name" : saveProject,
      "mentor" : saveMentor,
      "project_abstrac" : saveAbstract,
      "project is ready?" : saveIsModel,
    }).then((value) => {
      AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Registration has been complited successfully!", snackIcon: Icons.cancel_outlined),
    }).catchError((error) {
      AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Something went wrong!", snackIcon: Icons.cancel_outlined);
    },)
    
    ;
  }
  
}