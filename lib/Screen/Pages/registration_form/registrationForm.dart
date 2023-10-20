import 'package:avishkar/Screen/Pages/registration_form/Academicsdetails.dart';
import 'package:avishkar/Screen/Pages/registration_form/projectdetails.dart';
import 'package:avishkar/utils/app_text_field.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class RegisrationFormPage extends StatefulWidget {
  const RegisrationFormPage({super.key});

  @override
  State<RegisrationFormPage> createState() => _RegisrationFormPageState();
}

class _RegisrationFormPageState extends State<RegisrationFormPage> {
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * app_heights.height80,
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
                FloatingActionButton(
                  child: Text("Next",style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcademicsDetailsPage(),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
