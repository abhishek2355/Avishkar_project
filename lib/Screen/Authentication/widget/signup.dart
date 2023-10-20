import 'dart:developer';

import 'package:avishkar/Screen/Authentication/apis/authentication_api.dart';
import 'package:avishkar/Screen/Authentication/widget/login.dart';
import 'package:avishkar/Screen/Pages/home.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
    String phone = "";
    String name = "";
    String username = "";

    createUser() async{
      _formKey.currentState!.save();
      log("SignUp");
      await SignUpApis.createUserWithEmailAndPassword(email: email, password: password);
      await SignUpApis.addUsarData(email: email, name: name, password: password, phone: phone, username: username);
      log('Done');
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
              child: Stack(
                children: [
                  Container(
                    height: screenHeight * 370 / 926,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/signup.jpg'))
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 340 / 926,),
                        TextFormFields(
                          hintText: "Example123", 
                          labelText: "Username",
                          onSaved: (value){
                            if(value != null){
                              username = value;
                            }
                          },
                        ),
                        SizedBox(height: screenHeight * app_heights.height20,),
                        TextFormFields(
                          hintText: "12345678922", 
                          labelText: "Phone",
                          onSaved: (value){
                            if(value != null){
                              phone = value;
                            }
                          },
                        ),
                        SizedBox(height: screenHeight * app_heights.height20,),
                        TextFormFields(
                          hintText: "example123@gmail.com",
                          labelText: "Email",
                          onSaved: (value){
                            if(value != null){
                              email = value;
                            }
                          },
                        ),
                        SizedBox(height: screenHeight * app_heights.height20,),
                        TextFormFields(
                          hintText: "Fname Mname Lname", 
                          labelText: "Full Name",
                          onSaved: (value){
                            if(value != null){
                              name = value;
                            }
                          },
                        ),
                        SizedBox(height: screenHeight * app_heights.height20,),
                        TextFormFields( 
                          hintText: "Example@123", 
                          labelText: "Password",
                          onSaved: (value){
                            if(value != null){
                              password = value;
                            }
                          },
                        ),
                        SizedBox(height: screenHeight * app_heights.height60,),
                        SizedBox(
                          height: screenHeight * app_heights.height60,
                          width: screenWidth,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.purple[100]),
                            onPressed: (){createUser();}, 
                            child: Text('Sign up', style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height25,),),
                          ),
                        ),
                  
                        SizedBox(height: screenHeight * app_heights.height40,),
                  
                        InkWell(
                          onTap: widget.onPressed,
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                text: "Already have an account?",
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'Login',
                                    style: TextStyle(fontSize: screenHeight * app_heights.height20,fontWeight: FontWeight.bold, color: Colors.blue),
                                  )
                                ]
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
               
              ),
            ),
          ),
        ),
      ),
    );
  }
}