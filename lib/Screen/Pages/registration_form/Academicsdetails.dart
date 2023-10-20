import 'package:avishkar/Screen/Pages/registration_form/projectdetails.dart';
import 'package:avishkar/utils/app_text_field.dart';
import 'package:avishkar/utils/app_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class AcademicsDetailsPage extends StatefulWidget {
  const AcademicsDetailsPage({super.key});

  @override
  State<AcademicsDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<AcademicsDetailsPage> {
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
                  hintText: "e.g IT",
                  labelText: "Department Name",
                  onSaved: (value) {}),
              SizedBox(
                height: screenHeight * app_heights.height80,
              ),
              TextFormFields(
                  hintText: "e.g Medicine",
                  labelText: "Category",
                  onSaved: (value) {}),
              SizedBox(
                height: screenHeight * app_heights.height80,
              ),
              TextFormFields(
                  hintText: "e.g. UG", labelText: "Level", onSaved: (value) {}),
              SizedBox(
                height: screenHeight * app_heights.height80,
              ),
              FloatingActionButton(
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectDetailsPage(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
