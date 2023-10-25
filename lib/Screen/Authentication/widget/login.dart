import 'package:avishkar/Constants/app_strings.dart';
import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:avishkar/Screen/Authentication/apis/authentication_api.dart';
import 'package:avishkar/Screen/Authentication/controller/login_widget_controller.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:avishkar/Constants/app_strings.dart' as app_strings;
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
  bool studentLogin = true;

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
    Future<void> validateStudent() async {
      // check for the frontend validations first before going to backend validation.
      if (_formKey.currentState!.validate()) {
        _controller.updateIsLoading();
        // collect data from the form fields.
        _formKey.currentState!.save();

        // Check whether the login successful or not.
        await SignUpApis.signInWithEmailAndPassword(email: email, password: password);
        
        if(SignUpApis.issueForLogin) {
          _controller.updateIsLoading();
          if(context.mounted){
            AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: snackbarInvalidUsernameOrPassword, snackIcon: Icons.cancel_outlined);
          }
        }
      }
    }

    /// Method will involk after clicking on the Login button when the frontend validations are correct.
    /// It will collect data from all form fields and made a post request to validate the user.
    Future<void> validateAdmin() async {
      // check for the frontend validations first before going to backend validation.
      if (_formKey.currentState!.validate()) {
        _controller.updateIsLoading();
        // collect data from the form fields.
        _formKey.currentState!.save();

        // Check whether the login successful or not.
        await SignUpApis.signInWithEmailAndPasswordAdmin(email: email, password: password, context: context);
        
        if(SignUpApis.issueForLogin) {
          _controller.updateIsLoading();
          if (context.mounted){
            AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: snackbarInvalidUsernameOrPassword, snackIcon: Icons.cancel_outlined);
          }
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
                    //   image: const DecorationImage(image: AssetImage('assets/images/login_1.png')),
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(100), topRight: Radius.circular(-50)), color: Colors.purple[100]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              studentLogin = false;
                            });
                          },
                          child: Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: screenHeight * app_heights.height209,
                                  width: screenWidth * app_widths.width209,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(screenHeight * app_heights.height25)),
                                    color: (studentLogin) ? Colors.transparent :  Colors.purple[200],
                                    image:  const DecorationImage(image: AssetImage(app_strings.loginPageAdminImagePath))
                                  ),
                                ),
                                Text(app_strings.loginPageAdminLoginText, style: TextStyle(fontSize: screenHeight * app_heights.height25, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                        
                        InkWell(
                           onTap: (){
                            setState(() {
                              studentLogin = true;
                            });
                          },
                          child: Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: screenHeight * app_heights.height209,
                                  width: screenWidth * app_widths.width209,
                                  decoration: BoxDecoration(
                                    image:  const DecorationImage(image: AssetImage(app_strings.loginPageStudentImagePath)),
                                    color: (studentLogin) ? Colors.purple[200] :  Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(screenHeight * app_heights.height25)),
                                  ),
                                ),
                                Text(app_strings.loginPageStudentLoginText, style: TextStyle(fontSize: screenHeight * app_heights.height25, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),                      
                      ],
                    ),
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
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[100]),
                              onPressed: _controller.isLoading.value ? (){null;} : (){(studentLogin) ? validateStudent() : validateAdmin();}, 
                              child: _controller.isLoading.value ? Text('Validating...', style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height25,)) :Text('Login', style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height25,),));
                            }),
                          ),
                          SizedBox(height: screenHeight * app_heights.height100,),
                          InkWell(
                            onTap: widget.onPressed,
                            child: Center(
                              child: Text.rich(
                                TextSpan(
                                  text: "Don/'t have an account?",
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
