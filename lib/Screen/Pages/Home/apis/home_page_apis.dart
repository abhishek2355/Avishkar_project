import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentsProjectInfo{
  static const registerCollection = "Register";
  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(registerCollection);
  static List<RegistrationModel?> studentsRegistrationInfo = [];

  static Future<List<RegistrationModel?>> fetchStudentProjectData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection(registerCollection).get();
    studentsRegistrationInfo = querySnapshot.docs.map((doc) => RegistrationModel.from(json: doc.data())).toList();
    return studentsRegistrationInfo;
  }
}