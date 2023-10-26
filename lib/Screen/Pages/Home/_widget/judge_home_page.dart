import 'dart:developer';
import 'package:avishkar/Screen/Pages/Judge/widget/evaluation_project_detail.dart';
import 'package:avishkar/Screen/Pages/Project/apis/project_apis.dart';
import 'package:avishkar/Screen/Pages/Project/model/project_evaluation_model.dart';
import 'package:flutter/material.dart';
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

  _getStudentsDetail() async{
    try{
      students = await ProjectAdminForEvaluation.fetchStudentProjectData();
      setState(() {
        isLoading = true;
      });
      log("$students");
    }catch(e){
      log("$e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;

    return SafeArea(
      child: Scaffold(
        body: (isLoading) 
          ? SizedBox(
            height: screenHeight,
            child: 
              ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  var accepted = students[index];
                  return ListTile(
                    leading: Icon(Icons.account_circle,size: screenHeight * app_heights.height60,),
                    title: Text(accepted.uid),
                    trailing: Icon(Icons.arrow_forward_ios_outlined, size: screenHeight * app_heights.height20,),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EvaluationProjectDetailsScreen(uid: accepted.uid),));
                    },
                  );
                },
              ),
            )
          : const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}