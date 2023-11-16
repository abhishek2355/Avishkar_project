import 'package:avishkar/Screen/Pages/Evaluation/api/apis.dart';
import 'package:avishkar/Screen/Pages/Evaluation/widget/slider_parameter.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class MarksEvaluationScreen extends StatefulWidget {
  const MarksEvaluationScreen({super.key, required this.uid});
  final String uid;

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

  // Calculate the total marks
  double calculateTotalMarks() {
    return innovationRating +
        originalityRating +
        presentationSkillsRating +
        depthOfKnowledgeRating +
        productabilityRating;
  }

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    final double screenWidth =
        media.size.width - media.padding.left - media.padding.right;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.teal,
      //   title: Text('Marks Evaluation', style: TextStyle(fontSize: screenHeight * app_heights.height20),),
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios_rounded,
      //       color: Colors.white,
      //       size: screenHeight * app_heights.height25,
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(screenHeight * app_heights.height60),
                bottomRight:
                    Radius.circular(screenHeight * app_heights.height60),
              ),
              color: Colors.teal,
            ),
            height: screenHeight * 140 / 926,
            child: Stack(
              children: [
                Positioned(
                  top: screenHeight * app_heights.height60,
                  left: screenWidth * 270 / 428,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(screenHeight * app_heights.height15)),
                      color: const Color.fromARGB(255, 11, 217, 159),
                    ),
                    height: screenHeight * app_heights.height60,
                    width: screenWidth * 120 / 428,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "Total Marks",
                              style: TextStyle(
                                  fontSize: screenHeight * app_heights.height15,
                                  color: Colors.white),
                            ),
                            Text(
                              '40',
                              style: TextStyle(
                                  fontSize: screenHeight * app_heights.height25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * app_heights.height32,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: screenHeight * app_heights.height25,
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * app_heights.height75,
                  left: screenWidth * 90 / 428,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(screenHeight * app_heights.height15)),
                      color: const Color.fromARGB(255, 11, 217, 159),
                    ),
                    height: screenHeight * app_heights.height40,
                    width: screenWidth * 150 / 428,
                    child: Center(
                      child: Text(
                        "Evaluation",
                        style: TextStyle(
                            fontSize: screenHeight * app_heights.height25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ParameterWidget("Innovation", (value) {
                  setState(() {
                    innovationRating = value;
                  });
                }),
                ParameterWidget("Originality", (value) {
                  setState(() {
                    originalityRating = value;
                  });
                }),
                ParameterWidget("Presentation Skills", (value) {
                  setState(() {
                    presentationSkillsRating = value;
                  });
                }),
                ParameterWidget("Depth of Knowledge", (value) {
                  setState(() {
                    depthOfKnowledgeRating = value;
                  });
                }),
                ParameterWidget("Productability", (value) {
                  setState(() {
                    productabilityRating = value;
                  });
                }),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.teal, // Set the background color to teal
                  ),
                  onPressed: () async {
                    // Handle submission or calculation of marks here
                    final totalMarks = calculateTotalMarks();

                    await addMarks(totalMarks, widget.uid, context);

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.teal,
                          content: Text(
                            'Total Marks: $totalMarks',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * app_heights.height18),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * app_heights.height20)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  addMarks(double totalMarks, String userUid, BuildContext context) async {
    await EvalutionAPI.addMarks(
        totalMarks: totalMarks, userUid: userUid, context: context);
  }
}
