import 'dart:developer';

import 'package:avishkar/Screen/Evaluation/api/apis.dart';
import 'package:avishkar/Screen/Evaluation/widget/slider_parameter.dart';
import 'package:avishkar/Screen/Registration/apis/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class MarksEvaluationScreen extends StatefulWidget {
  const MarksEvaluationScreen({super.key, required this.uid});
  final RegistrationModel uid;

  @override
  MarksEvaluationScreenState createState() => MarksEvaluationScreenState();
}

class MarksEvaluationScreenState extends State<MarksEvaluationScreen> {
  // Initialize ratings for each parameter
  double innovationRating = 0.0;
  double originalityRating = 0.0;
  double presentationSkillsRating = 0.0;
  double depthOfKnowledgeRating = 0.0;
  double productabilityRating = 0.0;

  // For chnage the state of button
  bool isLoading = false;

  void updateIsLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }

  // Calculate the total marks
  double calculateTotalMarks() {
    return (innovationRating + originalityRating + presentationSkillsRating + depthOfKnowledgeRating + productabilityRating);
  }

  validateButton({required double screenHeight}) async{
    updateIsLoading();
    try{
      // Handle submission or calculation of marks here.
      final totalMarks = calculateTotalMarks();

      // Adding mark to the Firebase.
      await addMarks(totalMarks, widget.uid.saveEmail, context);

      // After adding mark's this snackbar will fire.
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.teal,
            content: Text(
              'Total Marks: $totalMarks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight * app_heights.height18
              ),
            ),
          ),
        );
      }

    }catch(e){
      log('$e --> judge');
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Appbar of evaluation screen.
              Container(
                height: screenHeight * app_heights.height66,
                color: const Color(0xFF212121),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_rounded, size: screenHeight * app_heights.height30, color: Colors.white,),
                            onPressed: (){Navigator.pop(context);},
                          ),
          
                          SizedBox(width: screenWidth * 105 / 428),
          
                          Text('Evaluation', style: TextStyle(fontSize: screenHeight * app_heights.height25, color: Colors.white, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16, vertical: screenHeight * app_heights.height20),
                child: Column(
                  children: [

                    // Innovation mark submission.
                    ParameterWidget(
                      parameterName: "Innovation", 
                      onRatingChanged: (value){
                        setState(() {
                          innovationRating = value;
                        });
                      }
                    ),

                    // Originality mark submission.
                    ParameterWidget(
                      parameterName: "Originality", 
                      onRatingChanged:  (value){
                        setState(() {
                          originalityRating = value;
                        });
                      }
                    ),

                    // Presentation Skills mark submission.
                    ParameterWidget(
                      parameterName: "Presentation Skills", 
                      onRatingChanged: (value) {
                        setState(() {
                          presentationSkillsRating = value;
                        });
                      }
                    ),

                    // Depth of Knowledge mark submission.
                    ParameterWidget(
                      parameterName: "Depth of Knowledge", 
                      onRatingChanged: (value) {
                        setState(() {
                          depthOfKnowledgeRating = value;
                        });
                      }
                    ),
                    
                    // Productability mark submission.
                    ParameterWidget(
                      parameterName: "Productability", 
                      onRatingChanged: (value) {
                        setState(() {
                          productabilityRating = value;
                        });
                      }
                    ),
                    
                    // Submit Button
                    Center(
                      child: SizedBox(
                        height: screenHeight * app_heights.height55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: (isLoading) ? const Color(0xFFBEADFA) : const Color(0xFF8e3de2),),
                          onPressed: () => (isLoading) ? null : validateButton(screenHeight: screenHeight),
                          child: Text( (isLoading) ? 'Adding' :'Submit',
                            style: TextStyle(fontSize: screenHeight * app_heights.height22, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addMarks(double totalMarks, String userEmail, BuildContext context) async {
    await EvalutionAPI.addMarks(totalMarks: totalMarks, userEmail: userEmail, context: context);
  }

}
