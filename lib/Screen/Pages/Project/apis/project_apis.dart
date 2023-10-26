import 'dart:developer';

import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProjectAdminForEvaluation{
  static const evaluationCollection = "evaluation";
  static const registrationCollection = "Register";

  static final CollectionReference evaluationCollections = FirebaseFirestore.instance.collection(evaluationCollection);
  static final CollectionReference regiseterCollections = FirebaseFirestore.instance.collection(registrationCollection);

  static List<RegistrationModel?> studentsRegistrationInfo = [];

  static Future<void> addData({required String email, required BuildContext context }) async{
    QuerySnapshot querySnapshot = await regiseterCollections.where("email", isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
          String documentId = document.id; // Get the document ID
          log("${documentId}");
          evaluationCollections.doc(documentId).set(
            {
              "uid" : documentId,
            }
          );
          
      }
    }

    // evaluationCollections.doc() .add({
    //   'Uid': userUid
    // }).then((value) {
    //   AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Request approved!", snackIcon: Icons.cancel_outlined, snackColor: Colors.green);
    // }).catchError((e){
    //   AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Something went wrong!", snackIcon: Icons.cancel_outlined,);
    // });
  }

  // static Future<List<RegistrationModel?>> fetchStudentProjectData() async {
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection(registerCollection).get();
  //   studentsRegistrationInfo = querySnapshot.docs.map((doc) => RegistrationModel.from(json: doc.data())).toList();
  //   return studentsRegistrationInfo;
  // }
}