import 'package:avishkar/Constants/app_strings.dart';
import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:avishkar/Screen/Authentication/apis/authentication_api.dart';
import 'package:avishkar/Screen/Authentication/controller/login_widget_controller.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginWidgetController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailTextFormFieldValidationKey = GlobalKey<FormFieldState>();
  final _passwordTextFormFieldValidationKey = GlobalKey<FormFieldState>();

  String email  = "";
  String password = "";

  @override
  void initState() {
    _controller = LoginWidgetController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;
    

    /// Method will involk after clicking on the Login button when the frontend validations are correct.
    /// It will collect data from all form fields and made a post request to validate the user.
    Future<void> _validateUser() async {
      // check for the frontend validations first before going to backend validation.
      if (_formKey.currentState!.validate()) {
        _controller.updateIsLoading();
        // collect data from the form fields.
        _formKey.currentState!.save();

        // Check whether the login successful or not.
        await SignUpApis.signInWithEmailAndPassword(email: email, password: password);
        
        if(SignUpApis.issue_for_login) {
          _controller.updateIsLoading();
          AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: snackbarInvalidUsernameOrPassword, snackIcon: Icons.cancel_outlined);
        }
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
                          AlphaSizedBoxOfTextFormFieldWidget(
                            prefixIcon: Icons.mail,
                            hintText: loginPageMailTextFormFieldHint,
                            textFormFieldType: TextFormFieldType.loginMail,
                            wrapper: AuthenticationWrapper.login(),
                            textFormFieldValidationKey: _emailTextFormFieldValidationKey,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            onSaved: (value) {
                              if (value != null) {
                                email = value;
                              }
                            },
                          ),

                          SizedBox(height: screenHeight * app_heights.height20,),

                          // Text (password) input field
                          AlphaSizedBoxOfTextFormFieldWidget(
                              prefixIcon: Icons.lock,
                              isSuffixIcon: true,
                              hintText: loginPagePasswordTextFormFieldHint,
                              textFormFieldType: TextFormFieldType.signupPassword,
                              wrapper: AuthenticationWrapper.login(),
                              textFormFieldValidationKey: _passwordTextFormFieldValidationKey,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              onSaved: (value) {
                                if (value != null) {
                                  password = value;
                                }
                              },
                            ),
        
                          SizedBox(height: screenHeight * app_heights.height40,),

                          SizedBox(
                            height: screenHeight * app_heights.height60,
                            width: screenWidth,
                            child: Obx(() {
                              return ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.purple[100]),
                              onPressed: _controller.isLoading.value ? (){null;} : (){_validateUser();}, 
                              child: _controller.isLoading.value ? Text('Validating...', style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height25,)) :Text('Login', style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height25,),));
                            }),
                          ),
                          SizedBox(height: screenHeight * app_heights.height100,),
                          InkWell(
                            onTap: widget.onPressed,
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
