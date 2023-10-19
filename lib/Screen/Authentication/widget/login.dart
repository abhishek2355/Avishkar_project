import 'dart:developer';

import 'package:avishkar/Screen/Authentication/widget/signup.dart';
import 'package:avishkar/Screen/Pages/home.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;
    String email  = "";
    String password = "";
    bool isLoading = false;

    signInWithEmailAndPassword() async{
      _formKey.currentState!.save();
      try {
        setState(() {
          isLoading = true;
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }catch (e) {
          final snackdemo = SnackBar(
            content: Text('Something went wrong'),
            backgroundColor: Colors.red,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(5),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: screenHeight * 426 / 926,
                    ),
                    Container(
                      color: Colors.purple[100],
                      height: screenHeight * 500 / 926,
                    )
                  ],
                ),
                  
                Positioned(
                  top: 0,
                  child: Container(
                    height: screenHeight * 426 / 926,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/images/login_1.png')),
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(100), topRight: Radius.circular(-50)), color: Colors.purple[100]),
                  ),
                ),
               
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: screenHeight * 500 / 926,
                    width: screenWidth,
                    decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(75), topRight: Radius.circular(-50)), color: Colors.white,),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width19),
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * app_heights.height80,),
                          TextFormFields(
                            hintText: "example123@gmail.com", 
                            labelText: "Email", 
                            icons: Icons.email_outlined,
                            onSaved: (value){
                              if(value != null){
                                email = value;
                              }
                            },
                          ),
                          SizedBox(height: screenHeight * app_heights.height20,),
                          TextFormFields(
                            hintText: "Pass@123", 
                            labelText: "Password", 
                            icons: Icons.lock_outline,
                            onSaved: (value){
                              if(value != null){
                                password = value;
                              }
                            },
                          ),
        
                          SizedBox(height: screenHeight * app_heights.height40,),
                          SizedBox(
                            height: screenHeight * app_heights.height60,
                            width: screenWidth,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.purple[100]),
                              onPressed: ()async{
                                await signInWithEmailAndPassword();                                
                              }, 
                              child:(isLoading) ? const CircularProgressIndicator() : Text('Login', style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height25,),)),
                          ),
                          SizedBox(height: screenHeight * app_heights.height100,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen(),));
                            },
                            child: Center(
                              child: Text.rich(
                                TextSpan(
                                  text: "Don\'t have an account?",
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'SignUp',
                                      style: TextStyle(fontSize: screenHeight * app_heights.height20,fontWeight: FontWeight.bold, color: Colors.purple[100]),
                                    )
                                  ]
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
