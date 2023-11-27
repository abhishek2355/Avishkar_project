import 'dart:developer';

import 'package:avishkar/Screen/Pages/Project/model/project_evaluation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProjectAdminForEvaluation{
  static const evaluationCollection = "evaluation";
  static const registrationCollection = "Register";

  static final CollectionReference evaluationCollections = FirebaseFirestore.instance.collection(evaluationCollection);
  static final CollectionReference regiseterCollections = FirebaseFirestore.instance.collection(registrationCollection);

  static List<EvaluationAcceptedModel> studentsRegistrationInfo = [];

  static Future<void> addData({required String email, required BuildContext context }) async{
    QuerySnapshot querySnapshot = await regiseterCollections.where("email", isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
          String documentId = document.id;

          // Added into the evaluation database.
          evaluationCollections.doc(documentId).set(
            {
              "uid" : documentId,
            }
          );

          // Update the accept status.
          DocumentReference documentReference  = regiseterCollections.doc(documentId);
          documentReference.update({
            'is_accept_admin' : true,
          }).then((value) {
            log("Updated Successfully!");
          }).catchError((error){
            log("Something went wrong");
          });
          
      }
    }
  }

  static Future<List<EvaluationAcceptedModel>> fetchStudentProjectData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection(evaluationCollection).get();
    studentsRegistrationInfo = querySnapshot.docs.map((doc) => EvaluationAcceptedModel.from(json: doc.data())).toList();
    return studentsRegistrationInfo;
  }
}