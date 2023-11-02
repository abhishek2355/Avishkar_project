import 'package:avishkar/Screen/Authentication/widget/login.dart';
import 'package:avishkar/Screen/Authentication/widget/signup.dart';
import 'package:flutter/material.dart';

class SignUpORLogin extends StatefulWidget {
  const SignUpORLogin({super.key});
  @override
  State<SignUpORLogin> createState() => _SignUpORLoginState();
}
class _SignUpORLoginState extends State<SignUpORLogin> {
  bool islogin = true;
  void toggle(){
    setState(() {
      islogin = !islogin;
    });
  }   
  @override
  Widget build(BuildContext context) {
    if(islogin){
      return LoginScreen(onPressed: toggle,);
    }else{
      return SignupScreen(onPressed: toggle ,);
    }
  }
}