import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:avishkar/Screen/Authentication/apis/authentication_api.dart';
import 'package:avishkar/Screen/Authentication/controller/signup_widget_controller.dart';
import 'package:avishkar/Screen/Authentication/widget/login.dart';
import 'package:avishkar/Screen/Pages/Home/_widget/home.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:avishkar/utils/app_text_form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:avishkar/Constants/app_strings.dart' as app_strings;
import 'package:avishkar/Constants/app_font_sizes.dart' as app_font_sizes;
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    super.key, 
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  // Signup Controller
  late SignupWidgetController _controller;

  // TextFormField validation global keys
  final _signUpFormKey = GlobalKey<FormState>();
  final _emailTextFormFieldValidationKey = GlobalKey<FormFieldState>();
  final _userNameTextFormFieldValidationKey = GlobalKey<FormFieldState>();
  final _passwordTextFormFieldValidationKey = GlobalKey<FormFieldState>();

  // inputdecoration mobile form field.
  Color labelTextColor = Colors.black;
  Color enabledBorderColor = Colors.black;
  Color focusedBorderColor = Colors.black;

  // Wrapper object
  final AuthenticationWrapper _signupWrappers = AuthenticationWrapper.signup();

  // Varibale to store the entered values.
  String email  = "";
  String password = "";
  String phone = "";
  String name = "";
  String username = "";

  @override
  void initState() {
    _controller = SignupWidgetController();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }  
  
  // Method for update the Lable Text of Text-Form_field.
  updateLabelTextColor() {
    if (!_controller.isShowMobileLabelText.value) {
      labelTextColor = Colors.black54;
    } else if (!_signupWrappers.getIsValid(formFieldType: TextFormFieldType.signupMobile)) {
      labelTextColor = Colors.red;
    } else {
      labelTextColor = Colors.green;
    }
    enabledBorderColor = _signupWrappers.getIsValid(formFieldType: TextFormFieldType.signupMobile) ? Colors.green : Colors.black;
    focusedBorderColor = _signupWrappers.getIsValid(formFieldType: TextFormFieldType.signupMobile) ? Colors.green : Colors.blue.shade500;
  }

  // Method for Register the user in the application.
  Future<void> _validateUserRegistration() async{
    if (_signUpFormKey.currentState!.validate()) {
      _controller.updateIsLoading();

      // collect data from the form fields.
      _signUpFormKey.currentState!.save();

      // Do the sign in and store the [mail] and [Password] for authentication...
      bool isCreat = await SignUpApis.createUserWithEmailAndPassword(email: email, password: password, context: context);
      
      // store the signin data into firebase Database...
      await SignUpApis.addUsarData(email: email, password: password, phone: phone, username: username);

      // If Error occured
      if(isCreat){
        _controller.updateIsLoading();
        if(context.mounted){
          AlphaSnackBarUtilities.showErrorAlertBar(context: context);
          _controller.updateIsLoading();
        }
      }else{
        if(context.mounted){
          AlphaSnackBarUtilities.showSuccessfullAlertBar(context: context, alertText: "Successfully Created Account",);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          _controller.updateIsLoading();
        }
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout.
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            child: Stack(
              children: [
                // App Header Bar of the application.
                // const AppHeaderBar(),
                
                // Registration TextFormField.
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        Image.asset('assets/images/signup.jpg'),
                        
                        // username input field
                        AlphaSizedBoxOfTextFormFieldWidget(
                          prefixIcon: Icons.person,
                          hintText: app_strings.signupPageUserNameTextFormFieldHint,
                          textFormFieldType: TextFormFieldType.signupUserName,
                          wrapper: _signupWrappers,
                          textFormFieldValidationKey: _userNameTextFormFieldValidationKey,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          onSaved: (value) {
                            if (value != null) {
                              username = value;
                            }
                          },
                        ),
                
                
                        SizedBox(height: screenHeight * app_heights.height20,),
                        
                        // Mobile Number input field
                        Obx(() {
                          return SizedBox(
                            height: screenHeight * app_heights.height59,
                            child: InternationalPhoneNumberInput(
                              formatInput: false,
                              textStyle: TextStyle(fontSize: screenHeight * app_heights.height18),
                              autoValidateMode: AutovalidateMode.onUserInteraction,
                              maxLength: 10,
                              initialValue: PhoneNumber(isoCode: "IN"),
                              validator: (mobile) {
                                var msg = AlphaTextFormFieldValidatorUtilities.GlobalValidator(validatorValue: mobile, formFieldType: TextFormFieldType.signupMobile, wrapper: _signupWrappers);
                                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                  _controller.makeIsShowMobileTextFormFieldLabelTextTrue();
                                  _controller.updateWrapperLabelText(_signupWrappers, TextFormFieldType.signupMobile);
                                  updateLabelTextColor();
                                });
                                return msg;
                              },
                              onSaved: (value) {
                                if (value.phoneNumber != null) {
                                  phone = value.phoneNumber!;
                                }
                              },
                              onInputChanged: (PhoneNumber number) {},
                              selectorConfig: SelectorConfig(
                                selectorType: PhoneInputSelectorType.DIALOG,
                                showFlags: true,
                                leadingPadding: screenWidth * app_widths.width10,
                                setSelectorButtonAsPrefixIcon: true
                              ),
                              selectorTextStyle: TextStyle(
                                color: Colors.black,
                                fontSize: screenHeight * app_font_sizes.normalFontSize18,
                              ),
                              inputDecoration: InputDecoration(
                                errorStyle: TextStyle(height: screenHeight * app_heights.height0),
                                floatingLabelBehavior: _controller.isShowMobileLabelText.value ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
                                contentPadding: EdgeInsets.symmetric(vertical: screenHeight * app_heights.height19),
                                prefixIcon: Icon(
                                  Icons.mobile_friendly_outlined,
                                  size: screenHeight * app_font_sizes.normalFontSize18,
                                  color: labelTextColor,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: focusedBorderColor, width: screenWidth * app_widths.width1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: enabledBorderColor, width: screenWidth * app_widths.width1),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red, width: screenWidth * app_widths.width1),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: screenWidth * app_widths.width1),
                                ),
                                suffixIcon: null,
                                hintText: app_strings.signupPageMobileTextFormFieldHint,
                                labelText:(_controller.isShowMobileLabelText.value == false) ? "Mobile" : _controller.wrapperLabelText.value,
                                hintStyle: TextStyle(fontSize: screenHeight * app_font_sizes.normalFontSize18),
                                labelStyle: TextStyle(fontSize: screenHeight * app_font_sizes.normalFontSize18, fontWeight: FontWeight.bold, color: Colors.black54),
                              ),
                            ),
                          );
                        },),
                              
                        SizedBox(height: screenHeight * app_heights.height20,),
                        
                        // mail input field
                        AlphaSizedBoxOfTextFormFieldWidget(
                          prefixIcon: Icons.mail,
                          hintText: app_strings.signupPageMailTextFormFieldHint,
                          textFormFieldType: TextFormFieldType.signupMail,
                          wrapper: _signupWrappers,
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
                
                        // password input field
                        AlphaSizedBoxOfTextFormFieldWidget(
                          prefixIcon: Icons.lock,
                          isSuffixIcon: true,
                          hintText: app_strings.signupPagePasswordTextFormFieldHint,
                          textFormFieldType: TextFormFieldType.signupPassword,
                          wrapper: _signupWrappers,
                          textFormFieldValidationKey: _passwordTextFormFieldValidationKey,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          onSaved: (value) {
                            if (value != null) {
                              password = value;
                            }
                          },
                        ),
                        
                        SizedBox(height: screenHeight * app_heights.height60,),
                        
                        SizedBox(
                          height: screenHeight * app_heights.height60,
                          width: screenWidth,
                          child: Obx(() {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 131, 245, 236)),
                              onPressed: _controller.isLoading.value ? null : (){_validateUserRegistration();}, 
                              child: _controller.isLoading.value ? Text('Creating...', style: TextStyle(color: Colors.black, fontSize: screenHeight * app_heights.height25,),) : Text('Sign up', style: TextStyle(color: Colors.black, fontSize: screenHeight * app_heights.height25,),),
                            );
                          })
                        ),
                        SizedBox(height: screenHeight * app_heights.height100,),
                  
                        InkWell(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));},
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                text: "Already have an account? ",
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
                ),                  
              ],               
            ),
          ),
        ),
      ),
    );
  }
}