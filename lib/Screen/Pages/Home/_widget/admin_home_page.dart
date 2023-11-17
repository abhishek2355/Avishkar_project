import 'dart:developer';
import 'package:avishkar/Screen/Authentication/widget/login.dart';
import 'package:avishkar/Screen/Pages/Home/apis/home_page_apis.dart';
import 'package:avishkar/Screen/Pages/Project/widgets/projectinfoscreen.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
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
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    // List<String> filteritem = [
    //   "Engineering",
    //   "Agriculture",
    //   "Pharmacy",
    //   "Biotechnical",
    //   "Aerospace"
    // ];

    return SafeArea(
      child: Scaffold(
        body: (isLoading) 
          ? Column(
            children: [
              // AppBar of Admin Home screen.
              Container(
                height: screenHeight * app_heights.height66,
                color: Colors.teal[800],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_back_rounded, size: screenHeight * app_heights.height30, color: Colors.white,),
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        },
                      ),

                      SizedBox(
                        height: screenHeight * app_heights.height43,
                        width: screenWidth * app_widths.width130,
                        child: ElevatedButton(
                          onPressed: (){}, 
                          child: Text('Submit', style: TextStyle(color: Colors.black, fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold),)
                        ),
                      )
                      
                      // DropdownButton(
                      //   value: filterValue,
                      //   onChanged: (newValue) {
                      //     setState(() {
                      //       filterValue = newValue!;
                      //     });
                      //   },
                      //   items: filteritem.map((filteritem) {
                      //     return DropdownMenuItem(
                      //       value: filteritem,
                      //       child: Text(filteritem),
                      //     );
                      //   }).toList(),
                      // ),
                    
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * app_heights.height10,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('RECENT', style: TextStyle(fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold,),),
                    InkWell(
                      child: Text('VIEWED', style: TextStyle(fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold,),),
                      onTap: (){},
                    ),              
                  ],
                ),
              ),
                
              SizedBox(
                height: screenHeight * 820 / 926,
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
                          title: Text("${student.saveFname } ${student.saveLname}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height25),),
                          subtitle: Text(student.saveProject, style: TextStyle(color: Colors.grey, fontSize: screenHeight * app_heights.height18),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined, size: screenHeight * app_heights.height20,),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectDetailsScreen(student: student, isEvalutionScreen: false,),));
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
