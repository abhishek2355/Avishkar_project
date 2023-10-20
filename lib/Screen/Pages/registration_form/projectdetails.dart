import 'package:flutter/material.dart';
import 'package:avishkar/utils/app_text_field.dart';

import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  String selectedOption = 'Is Model Ready?'; // Set an initial value

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
          title: Text("Projects Details"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * app_heights.height30,
                ),
                TextFormFields(
                  hintText: "XYZ",
                  labelText: "Project Title",
                  onSaved: (value) {},
                ),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                  hintText: "XYZ",
                  labelText: "Mentor Name",
                  onSaved: (value) {},
                ),
                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),
                TextFormFields(
                  hintText: "Maximum 200 words",
                  labelText: "Abstract",
                  onSaved: (value) {},
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
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * app_heights.height20,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width10,
                    ),
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
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue!;
                      });
                    },
                    items: <String>[
                      'Is Model Ready?',
                      'YES',
                      'NO',
                      // Add your unique values here
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
