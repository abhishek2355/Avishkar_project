import 'dart:developer';
import 'package:avishkar/Screen/Authentication/widget/login.dart';
import 'package:avishkar/Screen/Home/apis/home_page_apis.dart';
import 'package:avishkar/Screen/Project/widgets/projectinfoscreen.dart';
import 'package:avishkar/Screen/Registration/apis/registration_model.dart';
import 'package:avishkar/Screen/admin/widgets/viewed_list.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  // late String filterValue = "Engineering";
  List<RegistrationModel?> students = [];
  bool isLoading = false;
  bool isRecent = true;

  @override
  void initState() {
    _getStudentsData();
    super.initState();
  }

  // get the student data from the firease
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
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: (isLoading) 
          ? Column(
            children: [
              // Recent and accepted button
              Container(
                color: const Color(0xFF212121),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: screenHeight * app_heights.height50,
                          decoration:  BoxDecoration(
                            border:(isRecent) 
                              ? const Border(bottom: BorderSide(color: Colors.white))
                              : const Border(bottom: BorderSide(color: Colors.black))
                          ),
                          child: InkWell(
                            child: Center(child: Text('Recent', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold, color: Colors.white),)),
                            onTap: (){
                              setState(() {
                                isRecent = true;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (contex) => const AdminHomePage()));
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
                            border:(isRecent) 
                              ? const Border(bottom: BorderSide(color: Colors.black))
                              : const Border(bottom: BorderSide(color:  Colors.white))
                            ),
                            child: InkWell(
                              child: Center(child: Text('Accepted', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold, color: Colors.white),)),
                              onTap: (){
                                setState(() {
                                  isRecent = false;
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                          },
                        )
                      ),
                    ],
                  ),
                ),
              ),
                
              // List of the students.
              Flexible(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    var student = students[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(student!.profileUrl),
                            backgroundColor: Colors.grey,
                          ),
                          title: Text("${student.saveFname }${student.saveLname}", style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height25),),
                          subtitle: Text(student.saveProject, style: TextStyle(fontFamily: "AppFont",color: Colors.grey, fontSize: screenHeight * app_heights.height18),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined, size: screenHeight * app_heights.height20,),
                          onTap: () async{
                            String refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectDetailsScreen(student: student, isEvalutionScreen: false, isAcceptedStudent: false),));
                            // perform the refresh
                            if(refresh == 'refresh'){
                              setState(() {
                                _getStudentsData();
                              });
                            }
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
                ),
              )
            ],
          )
          : const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
