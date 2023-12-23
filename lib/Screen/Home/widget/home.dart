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
          : SizedBox(
            height: screenHeight,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
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
                                  style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold),
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
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFDFA878),
                                    Color(0xFFBA704F)
                                  ]
                                ),
                                borderRadius: BorderRadius.circular(15)
                              ),
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
                                          style: TextStyle(fontFamily: "AppFont",
                                            fontSize: screenHeight * app_heights.height25,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white
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
                                                      style: TextStyle(fontFamily: "AppFont",
                                                        fontSize: screenHeight * app_heights.height16,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white
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
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                            
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                  
                            // Image Carouserl for registration, objective and schedule of Avishkar.
                            MyImageCarousel(
                              iconName: Icons.app_registration_rounded, 
                              headingText: "Register Step's", 
                              subText: "Check the avishkar project register process",
                              color_1: const Color(0xFF596FB7),
                              color_2: const Color(0xFF11235A),
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationRule()));},
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                  
                            // Image Carouserl for registration, objective and schedule of Avishkar.
                            MyImageCarousel(
                              iconName: Icons.data_object_outlined, 
                              headingText: "Avishkar Objectives", 
                              subText: "Check the avishkar objectives",
                              color_1: const Color(0xFFFFE382),
                              color_2: const Color(0xFFFFB534),
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AvishkarObjectives()));},
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                  
                            // Image Carouserl for registration, objective and schedule of Avishkar.
                            MyImageCarousel(
                              iconName: Icons.schedule_outlined, 
                              headingText: "Avishakar Schedule",
                              subText: "Check the avishkar schedule",
                              color_1: const Color(0xFF7ED7C1), 
                              color_2: const Color(0xFF2D9596),
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AvishkarSchedule()));},
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                  
                            // Image Carouserl for registration, objective and schedule of Avishkar.
                            MyImageCarousel(
                              iconName: Icons.category_outlined,
                              headingText: "Avishakar Category", 
                              subText: "Check the avishkar category",
                              color_1: const Color(0xFF9EDDFF),
                              color_2: const Color(0xFF6499E9),
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AvishkarCategory()));},
                            ),
                  
                            // SizedBox with height 20.
                            SizedBox(height: screenHeight * app_heights.height20,),
                          ],
                        ),
                      ),
                    ),
                ),

                
                // Button for the project registration and project preview.
                (previewButton)
                  ? Expanded(
                    flex: 0,
                    child: Stack(
                      children: [
                        Container(
                          height: screenHeight * app_heights.height80,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 25.0,
                                color: Colors.grey,
                              )
                            ]
                          ),
                        ),

                        Positioned(
                          bottom: screenHeight * app_heights.height10,
                          child: SizedBox(
                            height: screenHeight * app_heights.height60,
                            width: screenWidth,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  backgroundColor: const Color.fromARGB(255, 185, 131, 242),
                                ),
                                child: Text(
                                  "View Your Information",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "AppFont",
                                    fontSize: screenHeight * app_heights.height22,
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>StudentDetailScreen(email: user!.email.toString(),),));
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  : Expanded(
                    flex: 0,
                    child: Stack(
                      children: [

                        Container(
                          height: screenHeight * app_heights.height80,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 25.0,
                                color: Colors.grey,
                              )
                            ]
                          ),
                        ),

                        Positioned(
                          bottom: screenHeight * app_heights.height10,
                          child: SizedBox(
                            height: screenHeight * app_heights.height60,
                            width: screenWidth,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  backgroundColor: const Color.fromARGB(255, 185, 131, 242),
                                ),
                                child: Text(
                                  "Register your Project",
                                  style: TextStyle(
                                    fontFamily: "AppFont",
                                    fontSize: screenHeight * app_heights.height22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisrationFormPage(userUid: user!.uid),),);
                                },
                              ),
                            ),
                          ),
                        ),
                      



                      ],
                      
                    ),
                  ),

              ],
            ),
          ),
      ),
    );
  }
}




                  