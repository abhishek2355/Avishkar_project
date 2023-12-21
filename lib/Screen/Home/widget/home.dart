import 'dart:developer';
import 'package:avishkar/Screen/Home/widget/student_homehelper/avishkar_category.dart';
import 'package:avishkar/Screen/Home/widget/student_homehelper/avishkar_objective.dart';
import 'package:avishkar/Screen/Home/widget/student_homehelper/avishkar_project_registration_rule.dart';
import 'package:avishkar/Screen/Home/widget/student_homehelper/images_with_button.dart';
import 'package:avishkar/Screen/Home/widget/student_homehelper/avishkar_schedule.dart';
import 'package:avishkar/Screen/Registration/apis/registration_model.dart';
import 'package:avishkar/Screen/Registration/apis/registration_page_apis.dart';
import 'package:avishkar/Screen/Registration/widget/preview_screen.dart';
import 'package:avishkar/Screen/Registration/widget/registration_form.dart';
import 'package:avishkar/Screen/Setting/widget/setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Variables for the home page 
  late final User? user;
  int currentIndex = 0;
  bool isLoading = false;
  bool previewButton = false;
  double totalPercentage = 0;
  double sum = 0;

  // Function for get the user  data form the firebase.
  _getData() async {
    try {
      bool isSuccessfull = await RegistrationAPI.isProjectRegisterSuccessfully(userUid: user!.uid);
      if (isSuccessfull) {
        setState(() {
          previewButton = true;
        });
        
        RegistrationModel? studentsMark = await RegistrationAPI.fetchData(user!.email.toString());
                
        List<dynamic> test = studentsMark!.marks;
        for (var value in test) {
          sum += value;
        }

        setState(() {
          totalPercentage = (sum / test.length) * 2;
        });
      }
    } catch (e) {
      log("$e");
    }
  }

  // Init State. 
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    _getData();
    super.initState();
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
          // Show the CircularProgressIndicator till get the data form firebase.
          ? const Center(child: CircularProgressIndicator(),)
          
          // Once get the data from firebase show this widgets.
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width10),
                child: Column(
                  children: [
                    // Appbar of the Home screen
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Email of the logedIn user.
                        Text(
                          user!.email.toString(),
                          style: TextStyle(fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                        // Icons for logout the user.
                        IconButton(
                          onPressed: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingPage(user: user,)));
                          },
                          icon: Icon(
                            Icons.more_vert_outlined,
                            size: screenHeight * app_heights.height25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    // SizedBox with height 20.
                    SizedBox(height: screenHeight * app_heights.height20,),

                    // Avishkar logo and text container.
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.greenAccent,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenHeight * app_heights.height20),),
                        child: SizedBox(
                          height: screenHeight * app_heights.height240,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * app_widths.width16,
                              vertical: screenHeight * app_heights.height10,
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text("Aavishkar 2023-24",
                                    style: TextStyle(
                                      fontSize: screenHeight * app_heights.height25,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),

                                // SizedBox with height 20.
                                SizedBox(height: screenHeight * app_heights.height20,),

                                // Row of logo and information.
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Logo of Avishkar Competition
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(screenHeight * app_heights.height25)),
                                        image: const DecorationImage(image: AssetImage("assets/images/avishkar.png",),fit: BoxFit.fill)
                                      ),
                                      height: screenHeight * 130 / 926, 
                                      width: screenWidth * 105 / 428
                                    ),
                                
                                    // SizedBox with width 10.
                                    SizedBox(width: screenWidth * app_widths.width10,),
                                
                                    // Avishkar 2023 - 24 with text.
                                    Flexible(
                                      child: SizedBox(
                                        height: screenHeight * app_heights.height152,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "With the view of promoting research among the students, the then Hon'ble Governor of Maharashtra and the Chancellor of the Universities in the State of Maharashtra initiated Aavishkar.",
                                                style: TextStyle(
                                                  fontSize: screenHeight * app_heights.height16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // SizedBox with height 20.
                    SizedBox(height: screenHeight * app_heights.height20,),

                    // Button for the project registration and project preview.
                    (previewButton)
                      ? SizedBox(
                        height: screenHeight * app_heights.height50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(screenHeight * app_heights.height10)),
                              )
                            ),
                            backgroundColor: MaterialStateProperty.all(Colors.cyan),
                          ),
                          child: Text(
                            "View Your Information",
                            style: TextStyle(
                              fontSize: screenHeight * app_heights.height22,
                              color: Colors.white
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>StudentDetailScreen(email: user!.email.toString(),),));
                          },
                        ),
                      )
                      : SizedBox(
                            height: screenHeight * app_heights.height50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(screenHeight * app_heights.height10)),
                                  )
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.cyan),
                              ),
                              child: Text(
                                "Register your Project",
                                style: TextStyle(
                                  fontSize: screenHeight * app_heights.height22,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisrationFormPage(userUid: user!.uid),),);
                              },
                            ),
                          ),
                  
                    
                    // SizedBox with height 20.
                    SizedBox(height: screenHeight * app_heights.height20,),

                    // Image Carouserl for registration, objective and schedule of Avishkar.
                    MyImageCarousel(
                      imageUrl: "assets/images/registration.jpg", 
                      buttonName: "Register Step's", 
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationRule()));},
                    ),

                    // SizedBox with height 20.
                    SizedBox(height: screenHeight * app_heights.height20,),

                    // Image Carouserl for registration, objective and schedule of Avishkar.
                    MyImageCarousel(
                      imageUrl: "assets/images/objective.jpg", 
                      buttonName: "Avishkar Objectives", 
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AvishkarObjectives()));},
                    ),

                    // SizedBox with height 20.
                    SizedBox(height: screenHeight * app_heights.height20,),

                    // Image Carouserl for registration, objective and schedule of Avishkar.
                    MyImageCarousel(
                      imageUrl: "assets/images/schedule.jpg", 
                      buttonName: "Avishakar Schedule", 
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AvishkarSchedule()));},
                    ),

                    // SizedBox with height 20.
                    SizedBox(height: screenHeight * app_heights.height20,),

                    // Image Carouserl for registration, objective and schedule of Avishkar.
                    MyImageCarousel(
                      imageUrl: "assets/images/category.jpg", 
                      buttonName: "Avishakar Category", 
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AvishkarCategory()));},
                    ),

                    // SizedBox with height 20.
                    SizedBox(height: screenHeight * app_heights.height20,),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
