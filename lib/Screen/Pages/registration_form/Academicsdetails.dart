import 'dart:math';

import 'package:avishkar/Screen/Pages/registration_form/projectdetails.dart';
import 'package:avishkar/utils/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class AcademicsDetailsPage extends StatefulWidget {
  const AcademicsDetailsPage({Key? key}) : super(key: key);

  @override
  State<AcademicsDetailsPage> createState() => _AcademicsDetailsPageState();
}

class _AcademicsDetailsPageState extends State<AcademicsDetailsPage> {
  String selectedCategory = 'Select Category'; // Set an initial value
  String selectedLevel = 'Select Level';
  String selectedDepartment = 'Select Department';

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth =
        media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Academics Details"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * app_heights.height30,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * app_heights.height20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * app_heights.height20,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * app_widths.width10),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedDepartment,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDepartment = newValue!;
                        print("Selected Category: $selectedDepartment");
                      });
                    },
                    items: <String>[
                      'Select Department',
                      'CS',
                      'IT',
                      'Extc',
                      // Add your categories here
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * app_heights.height20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: null,
                      fontSize: screenHeight * app_heights.height20,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * app_widths.width10),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                        print("Selected Category: $selectedCategory");
                      });
                    },
                    items: <String>[
                      'Select Category',
                      'Category 1',
                      'Category 2',
                      'Category 3',
                      // Add your categories here
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * app_heights.height20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: null,
                      fontSize: screenHeight * app_heights.height20,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * app_widths.width10),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedLevel,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLevel = newValue!;
                        print("Selected level: $selectedLevel");
                      });
                    },
                    items: <String>[
                      'Select Level',
                      'UG',
                      'PG',

                      // Add your categories here
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectDetailsPage(),
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
