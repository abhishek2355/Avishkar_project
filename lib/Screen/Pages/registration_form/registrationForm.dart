import 'dart:io';

import 'package:avishkar/Screen/Pages/registration_form/Academicsdetails.dart';
import 'package:avishkar/Screen/Pages/registration_form/projectdetails.dart';
import 'package:avishkar/utils/app_text_field.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:image_picker/image_picker.dart';

class RegisrationFormPage extends StatefulWidget {
  const RegisrationFormPage({super.key});

  @override
  State<RegisrationFormPage> createState() => _RegisrationFormPageState();
}

class _RegisrationFormPageState extends State<RegisrationFormPage> {
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
                    // _showImagePickerBottomSheet(context);
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
                TextFormFields(
                    hintText: "Vishal",
                    labelText: "First Name",
                    onSaved: (value) {}),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                    hintText: "Test",
                    labelText: "Middle Name",
                    onSaved: (value) {}),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                    hintText: "Test",
                    labelText: "Last Name",
                    onSaved: (value) {}),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                    hintText: "Test",
                    labelText: "Father/Mother Name",
                    onSaved: (value) {}),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                    hintText: "example123@gmail.com",
                    labelText: "Email",
                    onSaved: (value) {}),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                    hintText: "1234567890",
                    labelText: "Mobile Number",
                    onSaved: (value) {}),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                    hintText: "1234567890",
                    labelText: "Father/Mother Mobile NO.",
                    onSaved: (value) {}),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                    hintText: "19-03-2002",
                    labelText: "DOB",
                    onSaved: (value) {}),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                    hintText: "e.g Lonere",
                    labelText: "Residential Address",
                    onSaved: (value) {}),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AcademicsDetailsPage(),
                      ),
                    );
                  },
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
    );
  }
}
