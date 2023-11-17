import 'package:avishkar/Screen/Authentication/widget/login.dart';
import 'package:avishkar/Screen/Authentication/widget/signup.dart';
import 'package:flutter/material.dart';

class SignUpORLogin extends StatefulWidget {
  const SignUpORLogin({super.key});

  @override
  State<SignUpORLogin> createState() => _SignUpORLoginState();
}

class _SignUpORLoginState extends State<SignUpORLogin> {
  // Declear the varibale for change the login to signup screen or viceVarsa.
  bool islogin = true;
  
  // Method to change the varibale value.
  void toggle(){
    setState(() {
      islogin = !islogin;
    });
  }   

  @override
  Widget build(BuildContext context) {
    return (islogin) ? LoginScreen(onPressed: toggle) : SignupScreen(onPressed: toggle);
  }
}