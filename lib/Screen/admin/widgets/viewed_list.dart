import 'dart:developer';

import 'package:avishkar/Screen/Authentication/widget/login.dart';
import 'package:avishkar/Screen/Home/apis/home_page_apis.dart';
import 'package:avishkar/Screen/Home/widget/admin_home_page.dart';
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
  bool isAccepted = true;
  
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
            
            // Recent and accepted button
            Container(
              color: const Color(0xFF212121),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: screenHeight * app_heights.height50,
                        decoration:  BoxDecoration(
                          border:(isAccepted) 
                            ? const Border(bottom: BorderSide(color: Colors.black,) )
                            : const Border(bottom: BorderSide(color: Colors.white))
                        ),
                        child: InkWell(
                          child: Center(child: Text('Recent', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold,color: Colors.white),)),
                          onTap: (){
                            setState(() {
                              isAccepted = false;
                            });
                            Navigator.of(context).popUntil((route) => route.isFirst);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) => const AdminHomePage()));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: screenHeight * app_heights.height50,
                          decoration:  BoxDecoration(
                          border:(isAccepted) 
                            ? const Border(bottom: BorderSide(color:  Colors.white))
                            : const Border(bottom: BorderSide(color:   Colors.black))
                          ),
                          child: InkWell(
                            child: Center(child: Text('Accepted', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold, color: Colors.white),)),
                            onTap: (){
                              setState(() {
                                isAccepted = true;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewedList()));
                            },
                          ),
                        ),
                      ),
                    ),              
                    Expanded(
                      flex: 0,
                      child: IconButton(
                        icon: Icon(Icons.logout_outlined, color: Colors.white, size: screenHeight * app_heights.height25,),
                        onPressed: (){
                          Navigator.of(context).popUntil((route) => route.isFirst);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const LoginScreen()));
                        },
                      )
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