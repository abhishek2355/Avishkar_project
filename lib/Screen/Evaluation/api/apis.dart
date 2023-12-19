import 'package:avishkar/Screen/Registration/apis/registration_page_apis.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EvalutionAPI{

  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(RegistrationAPI.registerCollection);
  
  static Future<void> addMarks({ required double totalMarks, required String userUid, required BuildContext context}) async{
    try{
      await usersCollection.doc(userUid).update({
        'myArrayField': FieldValue.arrayUnion([totalMarks]),
      });
      if(context.mounted){
        AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Makrs Added successfully!", snackIcon: Icons.cancel_outlined, snackColor: Colors.green);
      }
    }catch(e){
      if(context.mounted){
        AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Something Went wrong!", snackIcon: Icons.cancel_outlined);
      }
    }
  }
}