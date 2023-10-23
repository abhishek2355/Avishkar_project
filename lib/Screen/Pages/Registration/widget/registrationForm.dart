import 'dart:io';
import 'package:avishkar/Constants/app_strings.dart';
import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:avishkar/Screen/Authentication/controller/signup_widget_controller.dart';
import 'package:avishkar/Screen/Pages/Registration/widget/Academicsdetails.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:avishkar/utils/app_text_field.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:avishkar/utils/app_text_form_field_validator.dart';
import 'package:flutter/material.dart';

import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:avishkar/Constants/app_font_sizes.dart' as app_font_sizes;
import 'package:avishkar/Constants/app_strings.dart' as app_strings;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisrationFormPage extends StatefulWidget {
  const RegisrationFormPage({super.key});

  @override
  State<RegisrationFormPage> createState() => _RegisrationFormPageState();
}

class _RegisrationFormPageState extends State<RegisrationFormPage> {

  final _emailTextFormFieldValidationKey = GlobalKey<FormFieldState>();
    
    late SignupWidgetController _controller;
  
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
  
    // inputdecoration mobile form field.
    Color labelTextColor = Colors.black;
    Color enabledBorderColor = Colors.black;
    Color focusedBorderColor = Colors.black;
  
    // Varibales for store the information.
    String saveFname = "";
    String saveMname = "";
    String saveLname = "";
    String saveParentName = "";
    String saveEmail = "";
    String saveMobile = "";
    String saveDOB = "";
    String saveAddress = "";
  
    final _registrationFormKey = GlobalKey<FormState>();
  
    // Wrapper object
    final AuthenticationWrapper _signupWrappers = AuthenticationWrapper.signup();
    
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
  
    saveAndNext(){
      _registrationFormKey.currentState!.save();
      if(
        saveFname != "" &&
        saveMname != "" &&
        saveLname != "" &&
        saveParentName != "" &&
        saveEmail != "" &&
        saveMobile != "" &&
        saveDOB != "" &&
        saveAddress != ""
      ){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AcademicsDetailsPage(saveFname: saveFname, saveMname: saveMname, saveLname: saveLname, saveParentName: saveParentName, saveEmail: saveEmail, saveMobile: saveMobile, saveDOB: saveDOB, saveAddress: saveAddress,),));
      }
      else{
        AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Fill all the fields", snackIcon: Icons.cancel_outlined);
      }
  
    }


  XFile? _imageUrl;

  ImagePicker _picker = ImagePicker();
  void _gallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageUrl = image;
      });
    }
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
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Personal Details"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Form(
                key: _registrationFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * app_heights.height10,
                    ),
                    ClipOval(
                      child: _imageUrl != null
                          ? Image.file(
                              File(_imageUrl!.path),
                              width: screenHeight * 150 / 926,
                              height: screenHeight * 150 / 926,
                              fit: BoxFit
                                  .fill, // Use BoxFit.cover to maintain aspect ratio
                            )
                          : Container(
                              width: screenHeight * 150 / 926,
                              height: screenHeight * 150 / 926,
                              color: Colors
                                  .grey, // Placeholder color when no image is selected
                              child: Icon(
                                Icons.photo,
                                color: Colors.white,
                                size: screenHeight * 100 / 926,
                              ),
                            ),
                    ),
                    if (_imageUrl != null)
                      SizedBox(
                        height: screenHeight * app_heights.height10,
                      ),
                    ElevatedButton(
                      onPressed: () {
                        _gallery();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Container(
                      width: 200,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "Upload Passport Photo",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                    
                    SizedBox(
                      height: screenHeight * app_heights.height30,
                    ),
                    SizedBox(
                      height: screenHeight * app_heights.height40,
                    ),
                    // Fname
                    TextFormFields(
                      prefixIcon: Icons.person, 
                      isSuffixIcon: false, 
                      hintText: "Fname", 
                      labelText: "Fname", 
                      screenHeight: screenHeight, 
                      screenWidth: screenWidth,
                      onSaved: (value){
                        if(value != null){
                          saveFname = value;
                        }
                      },
                    ),

                    SizedBox(
                      height: screenHeight * app_heights.height40,
                    ),
                    // MName
                    TextFormFields(
                      prefixIcon: Icons.person, 
                      isSuffixIcon: false, 
                      hintText: "Mname", 
                      labelText: "Mname",
                      // textFormFieldValidationKey: textFormFieldValidationKey, 
                      screenHeight: screenHeight, 
                      screenWidth: screenWidth,
                       onSaved: (value){
                        if(value != null){
                          saveMname = value;
                        }
                      },
                    ),

                    SizedBox(
                      height: screenHeight * app_heights.height40,
                    ),
                    TextFormFields(
                      prefixIcon: Icons.person, 
                      isSuffixIcon: false, 
                      hintText: "Lname", 
                      labelText: "Lname",
                      screenHeight: screenHeight, 
                      screenWidth: screenWidth,
                       onSaved: (value){
                        if(value != null){
                          saveLname = value;
                        }
                      },
                    ),

                    SizedBox(
                      height: screenHeight * app_heights.height40,
                    ),


                    TextFormFields(
                      prefixIcon: Icons.person, 
                      isSuffixIcon: false, 
                      hintText: "Mother/Father Name", 
                      labelText: "Mother/Father Name", 
                      screenHeight: screenHeight, 
                      screenWidth: screenWidth,
                       onSaved: (value){
                        if(value != null){
                          saveParentName = value;
                        }
                      },
                    ),

                    SizedBox(
                      height: screenHeight * app_heights.height40,
                    ),

                    AlphaSizedBoxOfTextFormFieldWidget(
                      prefixIcon: Icons.mail,
                      hintText: loginPageMailTextFormFieldHint,
                      textFormFieldType: TextFormFieldType.loginMail,
                      wrapper: AuthenticationWrapper.login(),
                      textFormFieldValidationKey: _emailTextFormFieldValidationKey,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                       onSaved: (value){
                        if(value != null){
                          saveEmail = value;
                        }
                      },
                    ),

                    SizedBox(
                      height: screenHeight * app_heights.height40,
                    ),

                    // Mobile Number input field
                    Obx(() {
                      return SizedBox(
                      height: screenHeight * app_heights.height59,
                      child: InternationalPhoneNumberInput(
                        formatInput: false,
                        textStyle: TextStyle(fontSize: screenHeight * app_heights.height18),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 10,
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
                            saveMobile = value.phoneNumber!;
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
                          labelStyle: TextStyle(fontSize: screenHeight * app_font_sizes.normalFontSize18, fontWeight: FontWeight.bold, color: labelTextColor),
                        ),
                      ),
                    );
                    }),

                    SizedBox(
                      height: screenHeight * app_heights.height40,
                    ),

                    TextFormFields(
                      prefixIcon: Icons.date_range_outlined, 
                      isSuffixIcon: false, 
                      hintText: "DD/MM/YYYY", 
                      labelText:"DOB",
                      screenHeight: screenHeight, 
                      screenWidth: screenWidth,
                      onSaved: (value){
                        if(value != null){
                          saveDOB = value;
                        }
                      },
                    ),

                    SizedBox(
                      height: screenHeight * app_heights.height40,
                    ),
                    TextFormFields(
                      prefixIcon: Icons.area_chart_outlined, 
                      isSuffixIcon: false, 
                      hintText: "Address", 
                      labelText: "Address", 
                      screenHeight: screenHeight, 
                      screenWidth: screenWidth,
                      onSaved: (value){
                        if(value != null){
                          saveAddress = value;
                        }
                      },
                    ),

                    SizedBox(
                      height: screenHeight * app_heights.height40,
                    ),

                    ElevatedButton(
                      onPressed: () {saveAndNext();},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal, // Background color
                        onPrimary: Colors.white, // Text color
                        elevation: 4, // Elevation (shadow)
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Rounded shape
                        ),
                      ),
                      child: Container(
                        width: 100,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
             ),
           ),
         ),
          ),
        );
  }
}
