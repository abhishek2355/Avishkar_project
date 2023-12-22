import 'package:cloud_firestore/cloud_firestore.dart';

class EvaluationApis{
  static String collectionPath = 'Register'; 

  static Future<String?> findDocumentByUID({required String uid}) async {
    QuerySnapshot<Map<String, dynamic>> findDocumentReference = await FirebaseFirestore.instance.collection('Register').where('email', isEqualTo: uid).get();
    if(findDocumentReference.docs.isNotEmpty){
      String adminId =
      findDocumentReference.docs[0].id;
      return adminId;
    }
    return null;
  }
}