import 'package:avishkar/Screen/Evaluation/widget/evaluation_screen.dart';
import 'package:avishkar/Screen/Registration/apis/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class EvaluationProjectDetailsScreen extends StatefulWidget {
  const EvaluationProjectDetailsScreen({super.key, required this.uid});
  final RegistrationModel uid;

  @override
  State<EvaluationProjectDetailsScreen> createState() =>
      _EvaluationProjectDetailsScreenState();
}

class _EvaluationProjectDetailsScreenState extends State<EvaluationProjectDetailsScreen> {
  
  @override
  void initState() {
    super.initState();
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
                Column(
                  children: [
                    //  AppBar of the project detail screen.
                    Container(
                      color: const Color(0xFF212121),
                      height: screenHeight * app_heights.height66,
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
                            
                    SizedBox(height: screenHeight * app_heights.height10,),
                
                    // Profile picture and name of the student.
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(widget.uid.profileUrl),
                            backgroundColor: Colors.grey,
                            radius: screenHeight * app_heights.height100,
                          ),
                          
                          SizedBox(height: screenHeight * app_heights.height10,),
                      
                          Text("${widget.uid.saveFname } ${widget.uid.saveLname}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height28),),
                        ],
                      ),
                    ),
                            
                    SizedBox(height: screenHeight * app_heights.height30,),
                  ],
                ),

                // Button for evaluation.
                Center(
                  child: SizedBox(
                    height: screenHeight * app_heights.height55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8e3de2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MarksEvaluationScreen(uid: widget.uid,)));
                      },
                      child: Text(
                        'Submit Marks',
                        style: TextStyle(fontSize: screenHeight * app_heights.height22, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
            
            
                SizedBox(height: screenHeight * app_heights.height30,),
            
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: "Project Title: ", style: TextStyle(fontSize: screenHeight * app_heights.height22, color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: widget.uid.saveProject, style: TextStyle(fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                        ),
                      ),
            
                      SizedBox(height: screenHeight * app_heights.height20,),
                            
                      RichText(
                        text: TextSpan(
                          text: "Category of Project: ", style: TextStyle(fontSize: screenHeight * app_heights.height22, color: Colors.black, fontWeight: FontWeight.bold),
                          children: [TextSpan(text: widget.uid.saveCategory, style: TextStyle( fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal))]
                        ),
                        
                      ),
            
                      SizedBox(height: screenHeight * app_heights.height20,),
                            
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: "Project Abstract: ", style: TextStyle(fontSize: screenHeight * app_heights.height22, color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: widget.uid.saveAbstract, 
                              style: TextStyle( fontSize: screenHeight * app_heights.height20, 
                              color: Colors.black87, fontWeight: FontWeight.normal,
                              ),
                            ),
                          ]
                        ),
                        
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: screenHeight * app_heights.height40,),
            
                
                
                SizedBox(height: screenHeight * app_heights.height20,),
              ],
            ),
          )
          
      ),
    );
  }
}
