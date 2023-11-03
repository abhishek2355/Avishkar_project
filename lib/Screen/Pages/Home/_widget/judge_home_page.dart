import 'dart:developer';
import 'package:avishkar/Screen/Pages/Judge/widget/evaluation_project_detail.dart';
import 'package:avishkar/Screen/Pages/Project/apis/project_apis.dart';
import 'package:avishkar/Screen/Pages/Project/model/project_evaluation_model.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class JudgeHomePage extends StatefulWidget {
  const JudgeHomePage({super.key});

  @override
  State<JudgeHomePage> createState() => _JudgeHomePageState();
}

class _JudgeHomePageState extends State<JudgeHomePage> {
  List<EvaluationAcceptedModel> students = [];
  bool isLoading = false;

  @override
  void initState() {
    _getStudentsDetail();
    super.initState();
  }

  _getStudentsDetail() async {
    try {
      students = await ProjectAdminForEvaluation.fetchStudentProjectData();
      setState(() {
        isLoading = true;
      });
      log("$students");
    } catch (e) {
      log("$e");
    }
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text(
            "Student Participants",
            style: TextStyle(
                fontSize: screenHeight * app_heights.height20,
                color: Colors.white),
          ),
        ),
        body: (isLoading)
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * app_heights.height15,
                        left: screenWidth * app_widths.width19),
                    child: Text(
                      "Evaluation Pending",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: screenHeight * app_heights.height18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                          top: screenHeight * app_heights.height15),
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        var accepted = students[index];
                        return Card(
                          elevation:
                              2, // Add some elevation for a card-like effect
                          margin: EdgeInsets.symmetric(
                              vertical: screenHeight * app_heights.height10,
                              horizontal: screenWidth * app_widths.width19),
                          child: ListTile(
                            leading: CircleAvatar(
                              // You can use a CircleAvatar for a profile picture
                              // backgroundImage:
                              //     AssetImage(''), // Provide an image path
                              radius: screenHeight *
                                  app_heights
                                      .height25, // Adjust the size as needed
                            ),
                            title: Text(
                              accepted.uid,
                              style: TextStyle(
                                fontSize: screenHeight * app_heights.height15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EvaluationProjectDetailsScreen(
                                    uid: accepted.uid,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.all(20),
                  //       child: Text(
                  //         "Evaluation Done",
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: screenHeight * app_heights.height18,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.all(20),
                  //       child: Text(
                  //         "Out of 50 Mark ",
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: screenHeight * app_heights.height15,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Flexible(
                  //   // height: screenHeight * app_heights.height315,
                  //   child: ListView.builder(
                  //     padding: EdgeInsets.only(
                  //         top: screenHeight * app_heights.height10),
                  //     itemCount: students.length,
                  //     itemBuilder: (context, index) {
                  //       var accepted = students[index];
                  //       return Card(
                  //         elevation: 2,
                  //         margin: EdgeInsets.symmetric(
                  //             vertical: screenHeight * app_heights.height10,
                  //             horizontal: screenWidth * app_widths.width19),
                  //         child: ListTile(
                  //           leading: CircleAvatar(
                  //             // backgroundImage: AssetImage('path_to_image'),
                  //             radius: screenHeight * app_heights.height25,
                  //           ),
                  //           title: Text(
                  //             accepted.uid,
                  //             style: TextStyle(
                  //               fontSize: screenHeight * app_heights.height16,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           trailing: Text(
                  //             "40",
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: screenHeight * app_heights.height16,
                  //             ),
                  //           ),
                  //           onTap: () {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) =>
                  //                     EvaluationProjectDetailsScreen(
                  //                   uid: accepted.uid,
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

