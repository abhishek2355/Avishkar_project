
import 'package:avishkar/Screen/Judge/apis/evaluation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EvaluationApis{
  static String collectionPath = 'Register'; 

  static Future<EvaluationModel?> findDocumentByUID({required String uid}) async {
    EvaluationModel? model;
    DocumentReference documentReference = FirebaseFirestore.instance.collection(collectionPath).doc(uid);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    Map<String, dynamic> data =  documentSnapshot.data() as Map<String, dynamic>;
    model = EvaluationModel.from(json: data);
    return model;
  }
}