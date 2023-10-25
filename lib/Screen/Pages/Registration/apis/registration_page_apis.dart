
import 'dart:developer';
import 'package:avishkar/Screen/Pages/Home/_widget/home.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegistrationAPI{
  static const registerCollection = "Register";
  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(registerCollection);

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
    required userUid,
    required context,
    }){
    usersCollection.doc(userUid).set({
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
      "myArrayField" : []
    }).then((value) => {
      AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Registration has been complited successfully!", snackIcon: Icons.cancel_outlined, snackColor: Colors.green),
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),))
    }).catchError((error) {
      AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Something went wrong!", snackIcon: Icons.cancel_outlined);
    },);
  }

  static Future<RegistrationModel?> fetchData(String email) async {
    RegistrationModel? model;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(registerCollection).where('email', isEqualTo: email).get();
    log(email);
    // Loop through the documents and access data
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      model =  RegistrationModel.from(json: data);
    });
    log("${model}");
    return model;
  }

  static Future<bool> isProjectRegisterSuccessfully({required String userUid}) async{
    final collection = FirebaseFirestore.instance.collection(registerCollection);
    final userDoc = await collection.doc(userUid).get();
    return userDoc.exists;
  }

  
}