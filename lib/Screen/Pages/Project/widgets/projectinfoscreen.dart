import 'package:avishkar/Screen/Pages/Project/apis/project_apis.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({
    super.key, 
    required this.student, 
    required this.isEvalutionScreen
  });

  final RegistrationModel student;
  final bool isEvalutionScreen;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  void addForEvaluation() async {
    await ProjectAdminForEvaluation.addData(email: widget.student.saveEmail, context: context);
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))
                ),
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * app_heights.height66,
                      color: Colors.teal[800],
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: screenHeight * app_heights.height30,
                            ),
                            onPressed: (){Navigator.pop(context);},
                          ),
                   
                          SizedBox(width: screenWidth * app_widths.width75),
                    
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                            child: Text("Project Detail", style: TextStyle(color: Colors.white, fontSize: screenHeight * app_heights.height25, fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ),
          
                    SizedBox(height: screenHeight * app_heights.height20,),
          
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(widget.student.profileUrl),
                            backgroundColor: Colors.red,
                            radius: screenHeight * app_heights.height100,
                          ),
                          
                          SizedBox(height: screenHeight * app_heights.height20,),
                      
                          Text("${widget.student.saveFname } ${widget.student.saveLname}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height30),),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * app_heights.height30,),
                
                  ],
                ),
              ),

              SizedBox(height: screenHeight * app_heights.height30,),
          
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Project Title: ", style: TextStyle(fontSize: screenHeight * app_heights.height25, color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(text: widget.student.saveProject, style: TextStyle(fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                      ),
                    ),

                    SizedBox(height: screenHeight * app_heights.height20,),
                          
                    RichText(
                      text: TextSpan(
                        text: "Project Mentor: ", style: TextStyle(fontSize: screenHeight * app_heights.height25, color: Colors.black, fontWeight: FontWeight.bold),
                        children: [TextSpan(text: widget.student.saveMentor, style: TextStyle( fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                      ),
                    ),

                    SizedBox(height: screenHeight * app_heights.height20,),
                          
                    RichText(
                      text: TextSpan(
                        text: "Department: ", style: TextStyle(fontSize: screenHeight * app_heights.height25, color: Colors.black, fontWeight: FontWeight.bold),
                        children: [TextSpan(text: widget.student.saveDept, style: TextStyle( fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                      ),
                      
                    ),

                    SizedBox(height: screenHeight * app_heights.height20,),
                          
                    RichText(
                      text: TextSpan(
                        text: "Category of Project: ", style: TextStyle(fontSize: screenHeight * app_heights.height25, color: Colors.black, fontWeight: FontWeight.bold),
                        children: [TextSpan(text: widget.student.saveCategory, style: TextStyle( fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                      ),
                      
                    ),

                    SizedBox(height: screenHeight * app_heights.height20,),
                          
                    RichText(
                      text: TextSpan(
                        text: "Is model ready? ", style: TextStyle(fontSize: screenHeight * app_heights.height25, color: Colors.black, fontWeight: FontWeight.bold),
                        children: [TextSpan(text: widget.student.saveIsModel, style: TextStyle( fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                      ),
                      
                    ),

                    SizedBox(height: screenHeight * app_heights.height20,),
                          
                    RichText(
                      text: TextSpan(
                        text: "Project Abstract: ", style: TextStyle(fontSize: screenHeight * app_heights.height25, color: Colors.black, fontWeight: FontWeight.bold),
                        children: [TextSpan(text: widget.student.saveAbstract, style: TextStyle( fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                      ),
                      
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * app_heights.height40,),
          
              
              Center(
                child: SizedBox(
                  height: screenHeight * app_heights.height55,
                  width: screenWidth * app_widths.width190,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[800],
                    ),
                    onPressed: () {
                      addForEvaluation();
                    },
                    child: Container(
                      width: screenWidth * app_widths.width108,
                      height: screenHeight * app_heights.height40,
                      alignment: Alignment.center,
                      child: Text(
                        'Accept',
                        style: TextStyle(fontSize: screenHeight * app_heights.height25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * app_heights.height20,),
            ],
          ),
        
        ),
      ),
    );
  }
}

