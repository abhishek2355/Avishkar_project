import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpApis{

  static var user = FirebaseAuth.instance.currentUser;

  static  String signupCollection = 'users';
  static bool issue_for_login = false;
  static bool issue_for_signup = false;

  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection(signupCollection);

  // Store the signup data into the firebase...
  static createUserWithEmailAndPassword({required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = FirebaseAuth.instance.currentUser;
    }catch (e) {
      issue_for_signup = true;
    }
  }

  static addUsarData({required String email, required String password, required String phone, required String username}) async{
    await usersCollection.doc(user!.uid).set({
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    });
  }

  // Method for the login user... 
  static Future<void> signInWithEmailAndPassword({required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }catch(error){
      issue_for_login = true;
    }
  }

  // Method for the signout the user.
  static Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
  }
}