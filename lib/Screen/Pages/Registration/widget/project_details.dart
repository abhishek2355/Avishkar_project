import 'package:avishkar/utils/app_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    required this.saveLavel, 
    required this.userUid,
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
  final String userUid; 

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
  late final User? user;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            child: Form(
              key: _projectFormKey,
              child: Column(
                children: [
                  // AppBar
                  Container(
                    color: Colors.teal,
                    height: screenHeight * app_heights.height66,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (){Navigator.pop(context);}, 
                          icon: Icon(Icons.arrow_back_ios, size: screenHeight * app_heights.height28,color: Colors.white,),
                        ),
                        SizedBox(width: screenWidth * app_widths.width10,),
                        Text("Project Details", style: TextStyle(fontSize: screenHeight * app_heights.height28, color: Colors.white, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                
                  SizedBox(
                    height: screenHeight * app_heights.height30,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: TextFormFields(
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
                  ),
            
                  SizedBox(
                    height: screenHeight * app_heights.height40,
                  ),
            
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: TextFormFields(
                      prefixIcon: Icons.person_2_outlined, 
                      isSuffixIcon: false, 
                      hintText: "Mentor Name", 
                      labelText: "Mentor Name", 
                      screenHeight: screenHeight, 
                      screenWidth: screenWidth,
                      onSaved: (value){
                        if(value != null){
                          saveMentor = value;
                        }
                      },
                    ),
                  ),
            
                  SizedBox(
                    height: screenHeight * app_heights.height40,
                  ),
            
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: TextFormFields(
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
                  ),
            
                  SizedBox(
                    height: screenHeight * app_heights.height40,
                  ),
            
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: SizedBox(
                      height: screenHeight * app_heights.height66,
                      child: InputDecorator(
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
                            borderSide: const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        
                        child: DropdownButton<String>(
                          value: selectedOption,
                          isExpanded: true,
                          dropdownColor: Colors.grey,
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
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(fontSize: screenHeight * app_heights.height20)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
            
                  SizedBox(
                    height: screenHeight * app_heights.height40,
                  ),
            
                  SizedBox(
                    height: screenHeight * app_heights.height55,
                    width: screenWidth * app_widths.width190,
                    child: ElevatedButton(
                      onPressed: () {submit();},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                      ),
                      child: Container(
                        width: screenWidth * app_widths.width108,
                        height: screenHeight * app_heights.height40,
                        alignment: Alignment.center,
                        child: Text("Submit",style: TextStyle(fontSize: screenHeight * app_heights.height18, fontWeight: FontWeight.bold,),),
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
    //  If all the fields are filled.
    if(saveProject != "" && saveMentor != "" && saveAbstract != "" && saveIsModel != "" && saveIsModel != "Is Model Ready?" ){
      AlphaSnackBarUtilities.showConformAlertBar(
        context: context, 
        alertText: 'Do you want to Submit?',
        saveFname: widget.saveFname,
        saveMname: widget.saveMname,
        saveLname: widget.saveLname,
        saveEmail: widget.saveEmail,
        saveMobile: widget.saveMobile,
        saveDOB: widget.saveDOB,
        saveAddress: widget.saveAddress,
        saveDept: widget.saveDept,
        saveAbstract: saveAbstract,
        saveCategory: widget.saveCategory,
        saveIsModel: saveIsModel,
        saveLavel: widget.saveLavel,
        saveMentor: saveMentor,
        saveParentName: widget.saveParentName,
        saveProject: saveProject,
        userUid: widget.userUid,
        isAcceptAdmin: false
      );
    }
    // If any field are not filled then.
    else{
      AlphaSnackBarUtilities.showWarningAlertBar(context: context);
    }
  }
}
