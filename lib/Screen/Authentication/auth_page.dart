import 'package:avishkar/Screen/Authentication/widget/login.dart';
import 'package:avishkar/Screen/Authentication/widget/loginORsignup.dart';
import 'package:avishkar/Screen/Pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else{
            if(snapshot.hasData){
              return const HomeScreen();
            }
            else{
              return const SignUpORLogin();
            }
          }
        }
      )
    );
  }
}