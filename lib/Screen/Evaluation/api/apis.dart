import 'package:avishkar/Screen/Registration/apis/registration_page_apis.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EvalutionAPI{

  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(RegistrationAPI.registerCollection);
  
  static Future<void> addMarks({ required double totalMarks, required String userEmail, required BuildContext context}) async{
    try{
      QuerySnapshot<Map<String, dynamic>> findDocumentReference = await FirebaseFirestore.instance.collection('Register').where('email', isEqualTo: userEmail).get();
      if(findDocumentReference.docs.isNotEmpty){
        String adminId = findDocumentReference.docs[0].id;
        await usersCollection.doc(adminId).update({'myArrayField': FieldValue.arrayUnion([totalMarks]),});
      }
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