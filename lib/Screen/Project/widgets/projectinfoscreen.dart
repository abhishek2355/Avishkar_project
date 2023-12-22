import 'dart:developer';

import 'package:avishkar/Screen/Home/widget/admin_home_page.dart';
import 'package:avishkar/Screen/Project/apis/project_apis.dart';
import 'package:avishkar/Screen/Registration/apis/registration_model.dart';
import 'package:avishkar/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({
    super.key, 
    required this.student, 
    required this.isEvalutionScreen, 
    required this.isAcceptedStudent,
  });

  final RegistrationModel student;
  final bool isAcceptedStudent;
  final bool isEvalutionScreen;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  bool isAccepted = false;
  bool isRejected = false;

  void updateButtonStatus(){
    setState(() {
      isAccepted = !isAccepted;
    });
  }

  void updateRejectButtonStatus(){
    setState(() {
      isRejected = !isRejected;
    });
  }

  // Accepted button logic.
  void addForEvaluation() async {
    try{
      updateButtonStatus();
      await ProjectAdminForEvaluation.addData(email: widget.student.saveEmail, context: context);
      if(context.mounted){
        AlphaSnackBarUtilities.showSuccessfullAlertBar(
          context: context, 
          alertText: "Accepted Successfully!",
          onConfirmBtnTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdminHomePage()));}
        );
      }
      updateButtonStatus();
    }catch(e){
      log('At the time of accepting $e');
      if(context.mounted){
        AlphaSnackBarUtilities.showErrorAlertBar(context: context);
      }
    }
    
  }

  // Rejected button logic.
  void rejectFromEvaluation() async {
    try{
      updateRejectButtonStatus();
      if(context.mounted){
        AlphaSnackBarUtilities.showWarningAlertBar(
          context: context, 
          text: "Want to delete!", 
          onConfirmBtnTap: ()async{
            await ProjectAdminForEvaluation.deleteData(email: widget.student.saveEmail, context: context);
            if(context.mounted){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdminHomePage()));
            }
          }
        );
      }
      updateRejectButtonStatus();
    }catch(e){
      log('At the time of accepting $e');
      if(context.mounted){
        AlphaSnackBarUtilities.showErrorAlertBar(context: context);
      }
    } 
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
        backgroundColor: const Color(0xFFF5F7F8),
        body: SizedBox(
          height: screenHeight,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container with appBar, profile picture and name.
                      SizedBox(
                        child: Column(
                          children: [
                            //  AppBar of the project Information Screen.
                            Container(
                              height: screenHeight * app_heights.height66,
                              color:  const Color(0xFF212121),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_rounded,
                                      color: Colors.white,
                                      size: screenHeight * app_heights.height30,
                                    ),
                                    onPressed: (){
                                      Navigator.pop(context, 'refresh');
                                    },
                                  ),
                           
                                  SizedBox(width: screenWidth * app_widths.width75),
                            
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                                    child: Text("Project Detail", style: TextStyle(fontFamily: "AppFont",color: Colors.white, fontSize: screenHeight * app_heights.height25, fontWeight: FontWeight.bold,),),
                                  )
                                ],
                              ),
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                  
                            // Students profile picture and name.
                            Center(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(widget.student.profileUrl),
                                    backgroundColor: Colors.grey,
                                    radius: screenHeight * app_heights.height100,
                                  ),
                                  
                                  SizedBox(height: screenHeight * app_heights.height20,),
                              
                                  Text("${widget.student.saveFname }${widget.student.saveLname}", style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height28),),
                                ],
                              ),
                            ),
                  
                            // SizedBox with height 30.
                            SizedBox(height: screenHeight * app_heights.height30,),
                        
                          ],
                        ),
                      ),
                  
                      // Project information.
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Project title.
                            RichText(
                              text: TextSpan(
                                text: "Project Title: ", style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height22, color: Colors.black, fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(text: widget.student.saveProject, style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                              ),
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                  
                            // project mentor.  
                            RichText(
                              text: TextSpan(
                                text: "Project Mentor: ", style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height22, color: Colors.black, fontWeight: FontWeight.bold),
                                children: [TextSpan(text: widget.student.saveMentor, style: TextStyle(fontFamily: "AppFont", fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                              ),
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                  
                            // Zone of student.
                            RichText(
                              text: TextSpan(
                                text: "Zone: ", style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height22, color: Colors.black, fontWeight: FontWeight.bold),
                                children: [TextSpan(text: widget.student.saveDept, style: TextStyle(fontFamily: "AppFont", fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                              ),
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                                  
                            // Category of project.
                            RichText(
                              text: TextSpan(
                                text: "Category of Project: ", style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height22, color: Colors.black, fontWeight: FontWeight.bold),
                                children: [TextSpan(text: widget.student.saveCategory, style: TextStyle(fontFamily: "AppFont", fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                              ),
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                                  
                            // Is model ready?
                            RichText(
                              text: TextSpan(
                                text: "Is model ready? ", style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height22, color: Colors.black, fontWeight: FontWeight.bold),
                                children: [TextSpan(text: widget.student.saveIsModel, style: TextStyle(fontFamily: "AppFont", fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                              ),
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                                  
                            // Project Abstract.
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text: "Project Abstract: ", style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height22, color: Colors.black, fontWeight: FontWeight.bold),
                                children: [TextSpan(text: widget.student.saveAbstract, style: TextStyle(fontFamily: "AppFont", fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                              ),
                            ),
                          ],
                        ),
                      ),
                  
                      // SizedBox with height 40.
                      SizedBox(height: screenHeight * app_heights.height40,),
                    ],
                  ),
                ),
              ),

              if(widget.isAcceptedStudent == false)
                Expanded(
                flex: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 25.0,
                        color: Colors.grey,
                      )
                    ]
                  ),
                  child: Container(
                    color: Colors.white,
                    height: screenHeight * 90 / 926,
                    width: double.maxFinite,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Accept Button.
                          SizedBox(
                            height: screenHeight * app_heights.height55,
                            width: screenWidth * app_widths.width190,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: (isAccepted) ? const Color(0xFFBEADFA) : const Color(0xFF8e3de2),),
                              onPressed: () => (isAccepted) ? null : addForEvaluation(),
                              child: SizedBox(
                                child: Text((isAccepted)? 'Accepting...' : 'Accept',
                                  style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height25, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                                      
                          // Reject button
                          SizedBox(
                            height: screenHeight * app_heights.height55,
                            width: screenWidth * app_widths.width190,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Color(0xFF8e3de2))
                                ),
                                backgroundColor: (isRejected) ? Colors.grey : Colors.white,),
                              onPressed: () => (isRejected) ? null : rejectFromEvaluation(),
                              child: SizedBox(
                                child: Text((isRejected)? 'Rejecting...' : 'Reject',
                                  style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height25, color: const Color(0xFF8e3de2), fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

