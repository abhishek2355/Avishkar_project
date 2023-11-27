import 'dart:developer';
import 'dart:io';
import 'package:avishkar/Screen/Pages/Home/_widget/home.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class RegistrationAPI{
  static const registerCollection = "Register";
  static String downloadUrl = "";
  // Unique name of the file
  static String uniqueNameOfImage = DateTime.now().microsecondsSinceEpoch.toString();

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
    required isAcceptAdmin
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
      "myArrayField" : [],
      "profile_image": RegistrationAPI.downloadUrl,
      "is_accept_admin" : isAcceptAdmin
    }).then((value) => {
      AlphaSnackBarUtilities.showSuccessfullAlertBar(context: context, alertText: 'Registration has been complited successfully!'),
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false)
    // ignore: body_might_complete_normally_catch_error
    }).catchError((error){
      AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Something went wrong!", snackIcon: Icons.cancel_outlined);
    },);
  }

  static Future<RegistrationModel?> fetchData(String email) async {
    RegistrationModel? model;
    
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(registerCollection).where('email', isEqualTo: email).get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      model =  RegistrationModel.from(json: data);
      log('$model');
    }    
    return model;
  }

  static Future<bool> isProjectRegisterSuccessfully({required String userUid}) async{
    final collection = FirebaseFirestore.instance.collection(registerCollection);
    final userDoc = await collection.doc(userUid).get();
    return userDoc.exists;
  }  

  static Future<void> getImageUrl({required File? imagePath, required BuildContext context}) async {
    // Create the root of firestore reference.
    Reference referenceRoot = FirebaseStorage.instance.ref();
    // Create the child/ folder for the store the images.
    Reference referenceDirImages = referenceRoot.child('profile_images');
    // Create the reference for the final file.
    Reference referenceImageToUpload = referenceDirImages.child(uniqueNameOfImage);
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    // Store the file into firebase Storage
    try{
      await referenceImageToUpload.putFile(imagePath!, metadata);
      downloadUrl = await referenceImageToUpload.getDownloadURL();
    }catch(error){
      if(context.mounted){
        AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Something went wrong!", snackIcon: Icons.cancel_outlined);
      }
    }
  }
}