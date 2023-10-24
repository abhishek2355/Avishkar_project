import 'dart:developer';

import 'package:avishkar/Screen/Pages/Registration/widget/projectdetails.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class AcademicsDetailsPage extends StatefulWidget {
  const AcademicsDetailsPage({
    super.key, 
    required this.saveFname, 
    required this.saveMname, 
    required this.saveLname, 
    required this.saveParentName, 
    required this.saveEmail, 
    required this.saveMobile, 
    required this.saveDOB, 
    required this.saveAddress, 
    required this.userUid
  });

  final String saveFname;
  final String saveMname;
  final String saveLname;
  final String saveParentName;
  final String saveEmail;
  final String saveMobile;
  final String saveDOB;
  final String saveAddress;
  final String userUid;
 

  @override
  State<AcademicsDetailsPage> createState() => _AcademicsDetailsPageState();
}

class _AcademicsDetailsPageState extends State<AcademicsDetailsPage> {
  String selectedCategory = 'Select Category'; // Set an initial value
  String selectedLevel = 'Select Level';
  String selectedDepartment = 'Select Department';
  String saveDept = "";
  String saveCategory = "";
  String saveLavel = "";

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
                  height: screenHeight * app_heights.height40,
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
                        saveDept = selectedDepartment;
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
                  height: screenHeight * app_heights.height40,
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
                        saveCategory = selectedCategory;
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
                  height: screenHeight * app_heights.height40,
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
                        saveLavel = selectedLevel;
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
                  height: screenHeight * app_heights.height40,
                ),

                ElevatedButton(
                  onPressed: () { saveAndNext();},
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
  
  void saveAndNext() {
    log(saveDept);
    log(saveCategory);
    log(saveLavel);
    if(saveDept != "Select Department" && saveCategory != "Select Category" && saveLavel != "Select Level" && saveDept != "" && saveCategory != "" && saveLavel != "" ){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectDetailsPage(saveFname: widget.saveFname, saveMname: widget.saveMname, saveLname: widget.saveLname, saveParentName: widget.saveParentName, saveEmail: widget.saveEmail, saveMobile: widget.saveMobile, saveDOB: widget.saveDOB, saveAddress: widget.saveAddress,saveDept: saveDept, saveCategory: saveCategory, saveLavel: saveLavel,userUid: widget.userUid),));
    }
    else{
      AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Fill all the fields", snackIcon: Icons.cancel_outlined);
    }
  }
}
