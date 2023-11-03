import 'package:avishkar/Screen/Pages/Project/apis/project_apis.dart';
import 'package:avishkar/Screen/Pages/Project/widgets/project_detail_screen.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen(
      {super.key, required this.student, required this.isEvalutionScreen});
  final RegistrationModel student;
  final bool isEvalutionScreen;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  void addForEvaluation() async {
    await ProjectAdminForEvaluation.addData(
        email: widget.student.saveEmail, context: context);
  }

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth =
        media.size.width - media.padding.left - media.padding.right;
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
        title: Text(
          'Project Details',
          style: TextStyle(fontSize: screenHeight * app_heights.height20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenHeight * app_heights.height15,
            vertical: screenWidth * app_widths.width15),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProjectPhotoWidget(
                      imagePath: 'assets/images/Dbatu_3.jpg',
                      projectName: widget.student.saveProject,
                      category: widget.student.saveCategory,
                      abstract: widget.student.saveAbstract),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: () {
                addForEvaluation();
              },
              child: Text(
                'Accept',
                style: TextStyle(fontSize: screenHeight * app_heights.height20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

