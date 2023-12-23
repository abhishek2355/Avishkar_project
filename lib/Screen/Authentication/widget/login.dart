import 'package:avishkar/Screen/Authentication/widget/signup.dart';
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
  const LoginScreen({
    super.key,
  });

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<LoginScreen> {
  String selectedRole = 'Student';
  String email = "";
  String password = "";
  String filterDropDownValue = "Student";

  late LoginWidgetController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailTextFormFieldValidationKey = GlobalKey<FormFieldState>();
  final _passwordTextFormFieldValidationKey = GlobalKey<FormFieldState>();

  Map<String, Color> buttonColors = {
    'Student': const Color.fromARGB(255, 74, 228, 239),
    'Institute Admin': const Color.fromARGB(255, 74, 228, 239),
    'Judge': const Color.fromARGB(255, 74, 228, 239),
    'Zonal Admin': const Color.fromARGB(255, 74, 228, 239),
  };

  // Method for select the filter dropdown button value.
  void filterDropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        filterDropDownValue = selectedValue;
      });
    }
  }

  void changeRole(String role) {
    setState(() {
      selectedRole = role;
      // Change the color of the selected button
      buttonColors.updateAll((key, value) => value =
          key == role ? Colors.blue : const Color.fromARGB(255, 74, 228, 239));
    });
  }

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

      // If login not successfull.
      if (loginStatus) {
        _controller.updateIsLoading();
        if (context.mounted) {
          AlphaSnackBarUtilities.showErrorAlertBar(context: context);
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
        context: context
      );

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
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                // Container for background color.
                Container(
                  height: screenHeight * app_heights.height878,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color.fromARGB(236, 118, 2, 243), Colors.white],
                    ),
                  ),
                ),
                
                // Avishkar Logo.
                Positioned(
                  top: screenHeight * 200 / 926,
                  right: screenWidth * app_widths.width5,
                  child: Image.asset(
                    "assets/images/avishkarimage.png",
                    height: screenHeight * 480 / 926,
                    width: screenWidth * 420 / 428,
                    fit: BoxFit.fill,
                  ),
                ),
                
                // mail and password textFormFields with login button.
                Positioned(
                  bottom: screenHeight * app_heights.height20,
                  child: Container(
                    height: screenHeight * 450 / 926,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenWidth * app_widths.width50),
                        topRight: Radius.circular(screenWidth * 40 / 428),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Login As Text
                            Padding(
                              padding: EdgeInsets.only(top: screenHeight * app_heights.height40),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Login as ",
                                      style: TextStyle(fontFamily: "AppFont", fontSize: screenHeight * app_heights.height25)
                                    ),
                                    TextSpan(
                                      text: filterDropDownValue,
                                      style: TextStyle(fontFamily: "AppFont", fontSize: screenHeight * app_heights.height25, fontWeight: FontWeight.bold)
                                    )
                                  ]
                                )
                              ),
                            ),

                            // SizedBox with height 40.
                            SizedBox(height: screenHeight * app_heights.height40,),

                            //  Mail textformfield
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

                            // SizedBox with height 20.
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

                            // SizedBox with height 40.          
                            SizedBox(height: screenHeight * app_heights.height40,),
          
                            // Login Button.
                            SizedBox(
                              height: screenHeight * app_heights.height60,
                              width: screenWidth,
                              child: Obx(() {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: (_controller.isLoading.value) ? const Color(0xFFBEADFA) : const Color(0xFF8e3de2),
                                  ),
                                  onPressed: _controller.isLoading.value
                                      ? () {
                                          null;
                                        }
                                      : () {
                                          if (filterDropDownValue == "Student") {
                                            validateStudent();
                                          }
                                          if (filterDropDownValue == "Institute Admin") {
                                            validateAdmin();
                                          }
                                          if (filterDropDownValue == "Judge") {
                                            validateJudge();
                                          }
                                          if (filterDropDownValue == "Zonal Admin") {
                                            validateSuperAdmin();
                                          }
                                        },
                                  child: _controller.isLoading.value
                                      ? Text('Validating...',
                                          style: TextStyle(
                                            fontFamily: "AppFont", 
                                            color: Colors.white,
                                            fontSize: screenHeight * app_heights.height25,
                                          ),
                                        )
                                      : Text(
                                          'Login',
                                          style: TextStyle(
                                            fontFamily: "AppFont", 
                                            color: Colors.white,
                                            fontSize: screenHeight * app_heights.height25,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                );
                              }),
                            ),

                            // SizedBox with height 40.
                            SizedBox(height: screenHeight * app_heights.height40,),
          
                            // Go to signup screen option.
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                              },
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    text: "Don't have an account?",
                                    style: TextStyle(fontFamily: "AppFont", fontSize: screenHeight * app_heights.height18, color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: ' SignUp',
                                        style: TextStyle(fontFamily: "AppFont", 
                                          fontSize: screenHeight * app_heights.height18,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF8e3de2),
                                        ),
                                      )
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
                ),

                // DropDown of login screen.
                Positioned(
                  top: screenHeight * app_heights.height30,
                  right: screenWidth * app_widths.width30,
                  child: Container(
                    height: screenHeight * app_heights.height50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: filterDropDownValue,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width10,),
                        dropdownColor: const Color(0xFFBEADFA),
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        iconSize: screenHeight * app_heights.height24,
                        isDense: true,
                        style: TextStyle(
                          fontFamily: "AppFont", 
                          fontSize: screenHeight * app_heights.height12,
                          color: Colors.white
                        ),
                        items: [
                          // Student: 1st value of dropdown.
                          DropdownMenuItem(
                            value: "Student",
                            child: Text(
                              'Student',
                              style: TextStyle(fontFamily: "AppFont", 
                                fontSize: screenHeight * app_heights.height18,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // Institute Admin: 2nd value of dropDown.
                          DropdownMenuItem(
                            value: "Institute Admin",
                            child: Text(
                              'Institute Admin',
                              style: TextStyle(fontFamily: "AppFont", 
                                fontSize: screenHeight * app_heights.height18,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // Judge: 3rd value of dropDown.
                          DropdownMenuItem(
                            value: "Judge",
                            child: Text(
                              'Judge',
                              style: TextStyle(fontFamily: "AppFont", 
                                fontSize: screenHeight * app_heights.height18,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // Zonal Admin: 4th value of dropDown.
                          DropdownMenuItem(
                            value: "Zonal Admin",
                            child: Text(
                              'Zonal Admin',
                              style: TextStyle(fontFamily: "AppFont", 
                                fontSize: screenHeight * app_heights.height18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                        onChanged: filterDropDownCallBack,
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
