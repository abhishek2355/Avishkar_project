import 'package:avishkar/Screen/Pages/Evaluation/widget/evaluation_screen.dart';
import 'package:avishkar/Screen/Pages/Project/project_detail_screen.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key, required this.student, required this.isEvalutionScreen});
  final RegistrationModel student;
  final bool isEvalutionScreen;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: screenHeight * app_heights.height25,
          ),
        ),
        centerTitle: true,
        title: Text('Project Details', style: TextStyle(fontSize: screenHeight * app_heights.height20),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const ProjectPhotoWidget(imagePath: 'assets/images/Dbatu_3.jpg'),

                SizedBox(height: screenHeight * app_heights.height16),
              ],
            ),
            SizedBox(height: screenHeight * app_heights.height16),

            (widget.isEvalutionScreen) 
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Set the background color to teal
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MarksEvaluationScreen()
                      ),
                    );
                  },
                  child: Text('Go for Evaluation -->', style: TextStyle(fontSize: screenHeight * app_heights.height20),),
                )
              : Container()          
          ],
        ),
      ),
    );
  }
}
