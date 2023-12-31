import 'dart:developer';
import 'package:avishkar/Screen/Authentication/widget/login.dart';
import 'package:avishkar/Screen/Home/apis/home_page_apis.dart';
import 'package:avishkar/Screen/Judge/widget/evaluation_project_detail.dart';
import 'package:avishkar/Screen/Registration/apis/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class JudgeHomePage extends StatefulWidget {
  const JudgeHomePage({super.key});

  @override
  State<JudgeHomePage> createState() => _JudgeHomePageState();
}

class _JudgeHomePageState extends State<JudgeHomePage> {
  List<RegistrationModel?> students = [];

  bool isLoading = false;

  @override
  void initState() {
    _getStudentsDetail();
    super.initState();
  }

  _getStudentsDetail() async {
    try {
      students = await StudentsProjectInfo.fetchStudentProjectDataForJudge();
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
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: (isLoading)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar of Admin Home screen.
                  Container(
                    height: screenHeight * app_heights.height66,
                    color:  const Color(0xFF212121),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Paticipated Students', style: TextStyle(fontSize: screenHeight * app_heights.height25, color: Colors.white, fontWeight: FontWeight.bold),),

                          IconButton(
                            onPressed: (){
                              Navigator.of(context).popUntil((route) => route.isFirst);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                            }, 
                            icon: Icon(Icons.logout_outlined,size: screenHeight * app_heights.height30, color: Colors.white,)
                          )
                        ],
                      ),
                    ),
                  ),

                  
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * app_heights.height10,
                      left: screenWidth * app_widths.width16,
                      right: screenWidth * app_widths.width16
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: (){
                              setState(() {_getStudentsDetail();});
                            },
                            child: Text(
                              "PENDING",
                              style: TextStyle(
                                fontSize: screenHeight * app_heights.height20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: (){},
                            child: Text(
                              "COMPLETE",
                              style: TextStyle(
                                fontSize: screenHeight * app_heights.height20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),

                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: screenHeight * app_heights.height15),
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        var accepted = students[index];
                        return ListTile(
                          title: RichText(
                            text: TextSpan(
                              text: "$index : ", style: TextStyle(fontSize: screenHeight * app_heights.height20, color: Colors.black, fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(text: accepted!.saveProject, style: TextStyle(fontSize: screenHeight * app_heights.height20, color: Colors.black87, fontWeight: FontWeight.normal,),)
                              ]
                            ),
                          ),
                          onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) =>EvaluationProjectDetailsScreen(uid: accepted),),);
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

