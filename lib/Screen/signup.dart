import 'package:avishkar/Screen/login.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
     // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

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
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 340 / 926,),
                      const TextFormFields( hintText: "Example123", labelText: "Username"),
                      SizedBox(height: screenHeight * app_heights.height20,),
                      const TextFormFields( hintText: "12345678922", labelText: "Phone"),
                      SizedBox(height: screenHeight * app_heights.height20,),
                      const TextFormFields( hintText: "example123@gmail.com", labelText: "Email"),
                      SizedBox(height: screenHeight * app_heights.height20,),
                      const TextFormFields( hintText: "Fname Mname Lname", labelText: "Full Name"),
                      SizedBox(height: screenHeight * app_heights.height20,),
                      const TextFormFields( hintText: "Example@123", labelText: "Password"),
                      SizedBox(height: screenHeight * app_heights.height60,),
                      SizedBox(
                        height: screenHeight * app_heights.height60,
                        width: screenWidth,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.purple[100]),
                          onPressed: (){}, 
                          child: Text('Sign up', style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height25,),),
                        ),
                      ),

                      SizedBox(height: screenHeight * app_heights.height40,),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        },
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
                  
                ],
               
              ),
            ),
          ),
        ),
      ),
    );
  }
}