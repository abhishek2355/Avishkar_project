import 'package:avishkar/Screen/Pages/Registration/apis/registration_page_apis.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/utils/app_text_field.dart';

import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({
    Key? key, 
    required this.saveFname, 
    required this.saveMname, 
    required this.saveLname, 
    required this.saveParentName, 
    required this.saveEmail, 
    required this.saveMobile, 
    required this.saveDOB, 
    required this.saveAddress, 
    required this.saveDept, 
    required this.saveCategory, 
    required this.saveLavel
  }) : super(key: key);
  
  final String saveFname;
  final String saveMname;
  final String saveLname;
  final String saveParentName;
  final String saveEmail;
  final String saveMobile;
  final String saveDOB;
  final String saveAddress;
  final String saveDept;
  final String saveCategory;
  final String saveLavel;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  final _projectFormKey = GlobalKey<FormState>();
  String selectedOption = 'Is Model Ready?'; // Set an initial value
  String saveProject = "";
  String saveMentor = "";
  String saveAbstract = "";
  String saveIsModel = "";

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
            child: Form(
              key: _projectFormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * app_heights.height30,
                  ),
                  TextFormFields(
                    prefixIcon: Icons.school_outlined, 
                    isSuffixIcon: false, 
                    hintText: "Alpha", 
                    labelText: "Project Title", 
                    screenHeight: screenHeight, 
                    screenWidth: screenWidth,
                    onSaved: (value){
                      if(value != null){
                        saveProject = value;
                      }
                    },
                  ),
            
                  SizedBox(
                    height: screenHeight * app_heights.height40,
                  ),
            
                  TextFormFields(
                    prefixIcon: Icons.school_outlined, 
                    isSuffixIcon: false, 
                    hintText: "XYZ", 
                    labelText: "Mentor Name", 
                    screenHeight: screenHeight, 
                    screenWidth: screenWidth,
                    onSaved: (value){
                      if(value != null){
                        saveMentor = value;
                      }
                    },
                  ),
            
                  SizedBox(
                    height: screenHeight * app_heights.height40,
                  ),
            
                  TextFormFields(
                    prefixIcon: Icons.school_outlined, 
                    isSuffixIcon: false, 
                    hintText: "Maximum 200 words", 
                    labelText: "Abstract", 
                    screenHeight: screenHeight, 
                    screenWidth: screenWidth,
                    onSaved: (value){
                      if(value != null){
                        saveAbstract = value;
                      }
                    },
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
                          saveIsModel = selectedOption;
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
            
                  SizedBox(
                    height: screenHeight * app_heights.height40,
                  ),
            
                  ElevatedButton(
                        onPressed: () {submit();},
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
                            "Submit",
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
  
  void submit() {
    _projectFormKey.currentState!.save();
    if(saveProject != "" && saveMentor != "" && saveAbstract != "" && saveIsModel != "" && saveIsModel != "Is Model Ready?" ){
      // RegistrationAPI.addRegisterData(
      //   saveFname: widget.saveFname,
      //   saveMname: widget.saveMname,
      //   saveLname: widget.saveLname,
      //   saveAddress: widget.saveAddress,
      //   saveEmail: widget.saveEmail,
      //   saveMobile: widget.saveMobile,
      //   saveDOB: widget.saveDOB,
      //   saveLavel: widget.saveLavel,
      //   saveParentName: widget.saveParentName,
      //   saveAbstract: widget.saveAddress,
      //   saveDept: widget.saveDept,
      //   saveProject: saveProject,
      //   saveCategory: widget.saveCategory,
      //   saveIsModel: saveIsModel,
      //   saveMentor: saveMentor,
      //   context : context,
      // );      
    
    }
    else{
      AlphaSnackBarUtilities.showSnackBar(context: context, snackMessage: "Fill all the fields", snackIcon: Icons.cancel_outlined);
    }
  }
}
