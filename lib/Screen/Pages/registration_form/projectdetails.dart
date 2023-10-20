import 'package:avishkar/utils/app_text_field.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  // Accessing MediaQuery for responsive layout
  // Calculate the height and width of the screen.
  Widget build(BuildContext context) {
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
                  hintText: "XYZ",
                  labelText: "Project Title",
                  onSaved: (value) {}),
              SizedBox(
                height: screenHeight * app_heights.height80,
              ),
              TextFormFields(
                  hintText: "XYZ",
                  labelText: "Mentor Name",
                  onSaved: (value) {}),
              SizedBox(
                height: screenHeight * app_heights.height80,
              ),
              TextFormFields(
                  hintText: "Maximum 200 words",
                  labelText: "Abstract",
                  onSaved: (value) {}),
              SizedBox(
                height: screenHeight * app_heights.height80,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}


// SizedBox(
//                   height: screenHeight * app_heights.height80,
//                 ),
//                 TextFormFields(
//                     hintText: "e.g IT",
//                     labelText: "Department Name",
//                     onSaved: (value) {}),
//                 SizedBox(
//                   height: screenHeight * app_heights.height80,
//                 ),
//                 TextFormFields(
//                     hintText: "e.g Medicine",
//                     labelText: "Category",
//                     onSaved: (value) {}),
//                 SizedBox(
//                   height: screenHeight * app_heights.height80,
//                 ),
//                 TextFormFields(
//                     hintText: "e.g. UG",
//                     labelText: "Level",
//                     onSaved: (value) {}),
//                     SizedBox(
//                   height: screenHeight * app_heights.height80,
//                 ),