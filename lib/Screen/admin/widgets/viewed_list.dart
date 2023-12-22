import 'dart:developer';

import 'package:avishkar/Screen/Home/apis/home_page_apis.dart';
import 'package:avishkar/Screen/Project/widgets/projectinfoscreen.dart';
import 'package:avishkar/Screen/Registration/apis/registration_model.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class ViewedList extends StatefulWidget {
  const ViewedList({super.key});

  @override
  State<ViewedList> createState() => _ViewedListState();
}

class _ViewedListState extends State<ViewedList> {
  List<RegistrationModel?> acceptedStudents = [];
  bool isLoading = true;
  
  @override
  void initState() {
    _getStudentsData();
    super.initState();
  }

  _getStudentsData() async{
    try{
      acceptedStudents = await StudentsProjectInfo.fetchAdminAcceptedData();
      setState(() {
        isLoading = false;
      });
      // log("$acceptedStudents");
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
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: (isLoading)
        ? const Center(child: CircularProgressIndicator(),)
        : Column(
          children: [
            Container(
              height: screenHeight * app_heights.height66,
              color: const Color(0xFF212121),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_rounded, size: screenHeight * app_heights.height30, color: Colors.white,),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
      
            Flexible(
              child: ListView.builder(
                itemCount: acceptedStudents.length,
                itemBuilder: (BuildContext context, int index){
                  var getOneStudent = acceptedStudents[index];
                  return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(getOneStudent!.profileUrl),
                            backgroundColor: Colors.grey,
                          ),
                          title: Text("${getOneStudent.saveFname } ${getOneStudent.saveLname}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height25),),
                          subtitle: Text(getOneStudent.saveProject, style: TextStyle(color: Colors.grey, fontSize: screenHeight * app_heights.height18),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined, size: screenHeight * app_heights.height20,),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectDetailsScreen(student: getOneStudent, isEvalutionScreen: false, isAcceptedStudent: true),));
                          },
                        ),
                        Divider(
                          color: Colors.grey,
                          height: screenHeight * app_heights.height0,
                          thickness: 0.1,
                        )
                      ],
                    );
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}