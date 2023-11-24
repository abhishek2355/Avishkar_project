// ignore_for_file: file_names

import 'dart:io';
import 'package:avishkar/Constants/app_strings.dart';
import 'package:avishkar/Screen/Authentication/Wrapper/authentication_wrapper.dart';
import 'package:avishkar/Screen/Authentication/controller/signup_widget_controller.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_page_apis.dart';
import 'package:avishkar/Screen/Pages/Registration/widget/academics_details.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:avishkar/utils/app_text_field.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:avishkar/utils/app_text_form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:avishkar/Constants/app_font_sizes.dart' as app_font_sizes;
import 'package:avishkar/Constants/app_strings.dart' as app_strings;

class RegisrationFormPage extends StatefulWidget {
  const RegisrationFormPage({super.key, required this.userUid});
  final String userUid;

  @override
  State<RegisrationFormPage> createState() => _RegisrationFormPageState();
}

class _RegisrationFormPageState extends State<RegisrationFormPage> {
  final _emailTextFormFieldValidationKey = GlobalKey<FormFieldState>();
  // Variable Declaration
  late SignupWidgetController _controller;
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
  XFile? imageUrl;
  String downloadUrl = "";
  File? file;
  // Global form key
  final _registrationFormKey = GlobalKey<FormState>();
  // Wrapper object
  final AuthenticationWrapper _signupWrappers = AuthenticationWrapper.signup();
  // image Picker
  final ImagePicker _picker = ImagePicker();
  late final User? user;

  @override
  void initState() {
    _controller = SignupWidgetController();
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  updateLabelTextColor() {
    if (!_controller.isShowMobileLabelText.value) {
      labelTextColor = Colors.black54;
    } else if (!_signupWrappers.getIsValid(
        formFieldType: TextFormFieldType.signupMobile)) {
      labelTextColor = Colors.red;
    } else {
      labelTextColor = Colors.green;
    }
    enabledBorderColor = _signupWrappers.getIsValid(
            formFieldType: TextFormFieldType.signupMobile)
        ? Colors.green
        : Colors.black;
    focusedBorderColor = _signupWrappers.getIsValid(
            formFieldType: TextFormFieldType.signupMobile)
        ? Colors.green
        : Colors.blue.shade500;
  }

  void saveAndNext(
    {required String fname,
    required String mname,
    required String lname,
    required String parentName,
    required String email,
    required String mobile,
    required String birthDate,
    required String address,
    required XFile? profileUrl
    }) async {
    if (fname != "" && mname != "" && lname != "" && parentName != "" && birthDate != "" && address != "" && imageUrl != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AcademicsDetailsPage(
            saveFname: saveFname,
            saveMname: saveMname,
            saveLname: saveLname,
            saveParentName: saveParentName,
            saveEmail: saveEmail,
            saveMobile: saveMobile,
            saveDOB: saveDOB,
            saveAddress: saveAddress,
            userUid: widget.userUid
            ),
        ),
      );
      await RegistrationAPI.getImageUrl(imagePath: file, context: context);
    } else {
      AlphaSnackBarUtilities.showWarningAlertBar(context: context);
    }
  }

  _gallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      imageUrl = image;
      file = File(image.path);
    });
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
          child: Form(
            key: _registrationFormKey,
            child: Column(
              children: [
                // AppBar
                Container(
                  color: Colors.teal,
                  height: screenHeight * app_heights.height66,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: screenHeight * app_heights.height28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * app_widths.width10,
                      ),
                      Text(
                        "Personal Details",
                        style: TextStyle(
                            fontSize: screenHeight * app_heights.height28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height10,
                ),

                ClipOval(
                  child: imageUrl != null
                      ? Image.file(
                          File(imageUrl!.path),
                          width: screenHeight * 150 / 926,
                          height: screenHeight * 150 / 926,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: screenHeight * 150 / 926,
                          height: screenHeight * 150 / 926,
                          color: Colors.grey,
                          child: Icon(
                            Icons.photo,
                            color: Colors.white,
                            size: screenHeight * 100 / 926,
                          ),
                        ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height20,
                ),

                SizedBox(
                  height: screenHeight * app_heights.height55,
                  width: screenWidth * app_widths.width190,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _gallery();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Container(
                      width: screenWidth * app_widths.width190,
                      height: screenHeight * app_heights.height40,
                      alignment: Alignment.center,
                      child: Text(
                        "Upload Photo",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: screenHeight * app_heights.height25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),
                // Fname
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width16),
                  child: TextFormFields(
                    prefixIcon: Icons.person,
                    isSuffixIcon: false,
                    hintText: "First Name",
                    labelText: "First Name",
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    onSaved: (value) {
                      if (value != null) {
                        saveFname = value;
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),
                // MName
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width16),
                  child: TextFormFields(
                    prefixIcon: Icons.person,
                    isSuffixIcon: false,
                    hintText: "Middle Name",
                    labelText: "Middle Name",
                    // textFormFieldValidationKey: textFormFieldValidationKey,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    onSaved: (value) {
                      if (value != null) {
                        saveMname = value;
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width16),
                  child: TextFormFields(
                    prefixIcon: Icons.person,
                    isSuffixIcon: false,
                    hintText: "Last Name",
                    labelText: "Last Name",
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    onSaved: (value) {
                      if (value != null) {
                        saveLname = value;
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width16),
                  child: TextFormFields(
                    prefixIcon: Icons.person,
                    isSuffixIcon: false,
                    hintText: "Mother Name",
                    labelText: "Mother Name",
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    onSaved: (value) {
                      if (value != null) {
                        saveParentName = value;
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width16),
                  child: AlphaSizedBoxOfTextFormFieldWidget(
                    prefixIcon: Icons.mail,
                    hintText: loginPageMailTextFormFieldHint,
                    textFormFieldType: TextFormFieldType.loginMail,
                    initialValue: user!.email,
                    wrapper: AuthenticationWrapper.login(),
                    textFormFieldValidationKey:
                        _emailTextFormFieldValidationKey,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    onSaved: (value) {
                      if (value != null) {
                        saveEmail = value;
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                // Mobile Number input field
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * app_widths.width16),
                    child: SizedBox(
                      height: screenHeight * app_heights.height59,
                      child: InternationalPhoneNumberInput(
                        formatInput: false,
                        textStyle: TextStyle(
                            fontSize: screenHeight * app_heights.height18),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: PhoneNumber(isoCode: "IN"),
                        maxLength: 10,
                        validator: (mobile) {
                          var msg = AlphaTextFormFieldValidatorUtilities
                              .GlobalValidator(
                                  validatorValue: mobile,
                                  formFieldType: TextFormFieldType.signupMobile,
                                  wrapper: _signupWrappers);
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            _controller
                                .makeIsShowMobileTextFormFieldLabelTextTrue();
                            _controller.updateWrapperLabelText(_signupWrappers,
                                TextFormFieldType.signupMobile);
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
                            setSelectorButtonAsPrefixIcon: true),
                        selectorTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize:
                              screenHeight * app_font_sizes.normalFontSize18,
                        ),
                        inputDecoration: InputDecoration(
                          errorStyle: TextStyle(
                              height: screenHeight * app_heights.height0),
                          floatingLabelBehavior:
                              _controller.isShowMobileLabelText.value
                                  ? FloatingLabelBehavior.always
                                  : FloatingLabelBehavior.auto,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: screenHeight * app_heights.height19),
                          prefixIcon: Icon(
                            Icons.mobile_friendly_outlined,
                            size:
                                screenHeight * app_font_sizes.normalFontSize18,
                            color: labelTextColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: focusedBorderColor,
                                width: screenWidth * app_widths.width1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: enabledBorderColor,
                                width: screenWidth * app_widths.width1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: screenWidth * app_widths.width1),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: screenWidth * app_widths.width1),
                          ),
                          suffixIcon: null,
                          hintText:
                              app_strings.signupPageMobileTextFormFieldHint,
                          labelText:
                              (_controller.isShowMobileLabelText.value == false)
                                  ? "Mobile"
                                  : _controller.wrapperLabelText.value,
                          hintStyle: TextStyle(
                              fontSize: screenHeight *
                                  app_font_sizes.normalFontSize18),
                          labelStyle: TextStyle(
                              fontSize: screenHeight *
                                  app_font_sizes.normalFontSize18,
                              fontWeight: FontWeight.bold,
                              color: labelTextColor),
                        ),
                      ),
                    ),
                  );
                }),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width16),
                  child: TextFormFields(
                    prefixIcon: Icons.date_range_outlined,
                    isSuffixIcon: false,
                    hintText: "DD/MM/YYYY",
                    labelText: "Birth Date",
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    onSaved: (value) {
                      if (value != null) {
                        saveDOB = value;
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width16),
                  child: TextFormFields(
                    prefixIcon: Icons.area_chart_outlined,
                    isSuffixIcon: false,
                    hintText: "Address",
                    labelText: "Address",
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    onSaved: (value) {
                      if (value != null) {
                        saveAddress = value;
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),

                SizedBox(
                  height: screenHeight * app_heights.height55,
                  width: screenWidth * app_widths.width190,
                  child: ElevatedButton(
                    onPressed: () {
                      _registrationFormKey.currentState!.save();
                      saveAndNext(
                        fname: saveFname,
                        mname: saveMname,
                        lname: saveLname,
                        parentName: saveParentName,
                        email: saveEmail,
                        mobile: saveMobile,
                        birthDate: saveDOB,
                        address: saveAddress,
                        profileUrl: imageUrl
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Container(
                      width: screenWidth * app_widths.width108,
                      height: screenHeight * app_heights.height40,
                      alignment: Alignment.center,
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: screenHeight * app_heights.height20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
