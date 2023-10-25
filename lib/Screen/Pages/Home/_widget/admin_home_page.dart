import 'dart:developer';

import 'package:avishkar/Screen/Pages/Evaluation/widget/evaluation_screen.dart';
import 'package:avishkar/Screen/Pages/Home/apis/home_page_apis.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:avishkar/Screen/projectinfoscreen.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late String filterValue = "Engineering";
  List<RegistrationModel?> students = [];
  bool isLoading = false;

  @override
  void initState() {
    _getStudentsData();
    super.initState();
  }

  _getStudentsData() async{
    try{
      students = await StudentsProjectInfo.fetchStudentProjectData();
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

    List<String> filteritem = [
      "Engineering",
      "Agriculture",
      "Pharmacy",
      "Biotechnical",
      "Aerospace"
    ];

    return SafeArea(
      child: Scaffold(
        body: (isLoading) 
          ? Padding(
              padding: EdgeInsets.all(screenHeight * app_heights.height8),
              child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_rounded, size: screenHeight * app_heights.height20,),
                      onTap: (){Navigator.pop(context);},
                    ),
                    
                    DropdownButton(
                      value: filterValue,
                      onChanged: (newValue) {
                        setState(() {
                          filterValue = newValue!;
                        });
                      },
                      items: filteritem.map((filteritem) {
                        return DropdownMenuItem(
                          value: filteritem,
                          child: Text(filteritem),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                SizedBox(
                  height: screenHeight * app_heights.height10,
                ),

                SizedBox(
                  height: screenHeight,
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (BuildContext context, int index) {
                      var student = students[index];
                      if(index == 0){
                        return ListTile(
                        leading: Icon(Icons.account_circle,size: screenHeight * app_heights.height60,),
                        title: Text("${student!.saveFname } ${student.saveLname}"),
                        subtitle: Text(student.saveProject),
                        trailing: ElevatedButton(
                          child: Text("Accept", style: TextStyle(fontSize: screenHeight * app_heights.height20),),
                          onPressed: () {},
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectDetailsScreen(student: student, isEvalutionScreen: false),));
                        },
                      );
                      
                      }
                      else{
                        return ListTile(
                          leading: Icon(Icons.account_circle,size: screenHeight * app_heights.height60,),
                          title: Text("${student!.saveFname } ${student.saveLname}"),
                          subtitle: Text(student.saveProject),
                          trailing: ElevatedButton(
                            child: Text("Rejected", style: TextStyle(fontSize: screenHeight * app_heights.height20),),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MarksEvaluationScreen(),));
                            },
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectDetailsScreen(student: student, isEvalutionScreen: false),));
                          },
                        );
                      
                      }
                    },
                  ),
                )
              ],
              
        ),
      )
          : const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
