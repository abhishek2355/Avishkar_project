import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpApis{

  static  String signupCollection = 'users';

  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(signupCollection);

  static Future<void> addUserToFirestore({required String username, required String email, required String phone, required String password, required String name}) async {
    try {
      await usersCollection.doc().set({
        'username': username,
        'email': email,
        'phone': phone,
        'name': name,
        'password': password,
      });
    } catch (e) {
      print("Error: $e");
    }
  }
}