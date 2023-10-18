import 'package:avishkar/Screen/signup.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: Form(
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
                      image: DecorationImage(image: AssetImage('assets/images/login_1.png')),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(100), topRight: Radius.circular(-50)), color: Colors.purple[100]),
                  ),
                ),
               
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: screenHeight * 500 / 926,
                    width: screenWidth,
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(75), topRight: Radius.circular(-50)), color: Colors.white,),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width19),
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * app_heights.height80,),
                          TextFormFields( hintText: "example123@gmail.com", labelText: "Email", icons: Icons.email_outlined),
                          SizedBox(height: screenHeight * app_heights.height20,),
                          TextFormFields(hintText: "Pass@123", labelText: "Password", icons: Icons.lock_outline),
                          SizedBox(height: screenHeight * app_heights.height40,),
                          SizedBox(
                            height: screenHeight * app_heights.height60,
                            width: screenWidth,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.purple[100]),
                              onPressed: (){}, 
                              child: Text('Login', style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height25,),)),
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
