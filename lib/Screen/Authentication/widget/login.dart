import 'dart:developer';

import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_strings.dart';
import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:avishkar/Screen/Authentication/apis/authentication_api.dart';
import 'package:avishkar/Screen/Authentication/controller/login_widget_controller.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<LoginScreen> {
  String selectedRole = 'Student';
  String email = "";
  String password = "";
  Map<String, Color> buttonColors = {
    'Student': const Color.fromARGB(255, 245, 147, 237),
    'Admin': const Color.fromARGB(255, 245, 147, 237),
    'Judge': const Color.fromARGB(255, 245, 147, 237),
    'Super Admin': const Color.fromARGB(255, 245, 147, 237),
  };

  void changeRole(String role) {
    setState(() {
      selectedRole = role;
      // Change the color of the selected button
      buttonColors.updateAll((key, value) => value = key == role
          ? const Color.fromARGB(255, 248, 103, 236)
          : const Color.fromARGB(255, 245, 147, 237));
    });
  }

  late LoginWidgetController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailTextFormFieldValidationKey = GlobalKey<FormFieldState>();
  final _passwordTextFormFieldValidationKey = GlobalKey<FormFieldState>();

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

  Future<void> validateStudent() async {
    // check for the frontend validations first before going to backend validation.
    if (_formKey.currentState!.validate()) {
      _controller.updateIsLoading();
      // collect data from the form fields.
      _formKey.currentState!.save();

      // Check whether the login successful or not.
      bool loginStatus = await SignUpApis.signInWithEmailAndPassword(
          email: email, password: password);

      if (loginStatus) {
        _controller.updateIsLoading();
        if (context.mounted) {
          AlphaSnackBarUtilities.showSnackBar(
              context: context,
              snackMessage: snackbarInvalidUsernameOrPassword,
              snackIcon: Icons.cancel_outlined);
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
      bool loginStatus = await SignUpApis.signInWithEmailAndPasswordAdmin(
          email: email, password: password, context: context);

      if (loginStatus) {
        _controller.updateIsLoading();
        if (context.mounted) {
          AlphaSnackBarUtilities.showSnackBar(
              context: context,
              snackMessage: snackbarInvalidUsernameOrPassword,
              snackIcon: Icons.cancel_outlined);
        }
      }
    }
  }

  Future<void> validateJudge() async {
    // check for the frontend validations first before going to backend validation.
    if (_formKey.currentState!.validate()) {
      _controller.updateIsLoading();
      // collect data from the form fields.
      _formKey.currentState!.save();

      // Check whether the login successful or not.
      bool loginStatus = await SignUpApis.signInWithEmailAndPasswordJudge(
          email: email.toString(),
          password: password.toString(),
          context: context);

      if (loginStatus) {
        _controller.updateIsLoading();
        if (context.mounted) {
          AlphaSnackBarUtilities.showSnackBar(
              context: context,
              snackMessage: snackbarInvalidUsernameOrPassword,
              snackIcon: Icons.cancel_outlined);
        }
      }
    }
  }

  Future<void> validateSuperAdmin() async {
    // check for the frontend validations first before going to backend validation.
    // if (_formKey.currentState!.validate()) {
    //   _controller.updateIsLoading();
    //   // collect data from the form fields.
    //   _formKey.currentState!.save();

    //   // Check whether the login successful or not.
    //   bool loginStatus = await SignUpApis.signInWithEmailAndPasswordAdmin(email: email, password: password, context: context);

    //   if (loginStatus) {
    //     _controller.updateIsLoading();
    //     if (context.mounted) {
    //       AlphaSnackBarUtilities.showSnackBar(
    //           context: context,
    //           snackMessage: snackbarInvalidUsernameOrPassword,
    //           snackIcon: Icons.cancel_outlined);
    //     }
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth =
        media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple[100],
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenHeight * app_heights.height8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 75 / 928,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        for (String role in [
                          'Student',
                          'Admin',
                          'Judge',
                          'Super Admin'
                        ])
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * app_heights.height8),
                            child: InkWell(
                              onTap: () {
                                changeRole(role);
                              },
                              child: Container(
                                width: screenWidth * app_widths.width108,
                                height: screenHeight * app_heights.height56,
                                decoration: BoxDecoration(
                                  color: buttonColors[role],
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),

                                // Use the buttonColors map
                                child: Center(
                                  child: Text(
                                    role,
                                    style: TextStyle(
                                        fontSize: screenHeight *
                                            app_heights.height20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: screenHeight * app_heights.height20),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * app_widths.width25),
                      child: Container(
                        width: screenWidth * app_widths.width209,
                        height: screenHeight * 250 / 926,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/$selectedRole.png")),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 43 / 928,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: screenHeight * 500 / 926,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(screenWidth * app_widths.width75),
                          topRight: Radius.circular(screenWidth * -50 / 428)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * app_widths.width16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            //  Mail textformfield
                            AlphaSizedBoxOfTextFormFieldWidget(
                              prefixIcon: Icons.mail,
                              hintText: loginPageMailTextFormFieldHint,
                              textFormFieldType: TextFormFieldType.loginMail,
                              wrapper: AuthenticationWrapper.login(),
                              textFormFieldValidationKey:
                                  _emailTextFormFieldValidationKey,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              onSaved: (value) {
                                if (value != null) {
                                  email = value;
                                }
                              },
                            ),
                            SizedBox(
                              height: screenHeight * app_heights.height20,
                            ),
                            // Text (password) input field
                            AlphaSizedBoxOfTextFormFieldWidget(
                              prefixIcon: Icons.lock,
                              isSuffixIcon: true,
                              hintText: loginPagePasswordTextFormFieldHint,
                              textFormFieldType:
                                  TextFormFieldType.signupPassword,
                              wrapper: AuthenticationWrapper.login(),
                              textFormFieldValidationKey:
                                  _passwordTextFormFieldValidationKey,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              onSaved: (value) {
                                if (value != null) {
                                  password = value;
                                }
                              },
                            ),

                            SizedBox(
                              height: screenHeight * app_heights.height40,
                            ),

                            SizedBox(
                              height: screenHeight * app_heights.height60,
                              width: screenWidth,
                              child: Obx(() {
                                return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purple[100]),
                                    onPressed: _controller.isLoading.value
                                        ? () {
                                            null;
                                          }
                                        : () {
                                            if (selectedRole == "Student") {
                                              validateStudent();
                                            }
                                            if (selectedRole == "Admin") {
                                              validateAdmin();
                                            }
                                            if (selectedRole == "Judge") {
                                              validateJudge();
                                            }
                                            if (selectedRole == "Super Admin") {
                                              validateSuperAdmin();
                                            }
                                          },
                                    child: _controller.isLoading.value
                                        ? Text('Validating...',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenHeight *
                                                  app_heights.height25,
                                            ))
                                        : Text(
                                            'Login',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenHeight *
                                                  app_heights.height25,
                                            ),
                                          ));
                              }),
                            ),
                            SizedBox(
                              height: screenHeight * app_heights.height100,
                            ),
                            InkWell(
                              onTap: widget.onPressed,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                      text: "Don/'t have an account?",
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: 'SignUp',
                                          style: TextStyle(
                                              fontSize: screenHeight *
                                                  app_heights.height20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple[100]),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
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
