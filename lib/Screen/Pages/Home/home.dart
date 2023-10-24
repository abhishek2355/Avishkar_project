import 'dart:developer';

import 'package:avishkar/Screen/Authentication/apis/authentication_api.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_page_apis.dart';
import 'package:avishkar/Screen/Pages/Registration/widget/registrationForm.dart';
import 'package:avishkar/Screen/Pages/studentRegInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final User? user;
  int currentIndex = 0;
  bool isLoading = false;
  bool previewButton = false;

  List<String> imageList = [
    "assets/images/dbatu_2.png",
    "assets/images/Dbatu_3.jpg",
    "assets/images/Dbatu_1.jpeg",
    "assets/images/Dbatu_1.jpg",
    "assets/images/Dbatu_4.jpg",
  ];

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
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

    // Function for logout the user
    signOut() {
      SignUpApis.logOut();
    }

    // Main body of the home screen
    return SafeArea(
      child: Scaffold(
        body: (isLoading)
          ? const Center(child: CircularProgressIndicator(),)
          : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * app_widths.width16),
            child: Column(
              children: [
                // Row for the
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(user!.email.toString(),
                      style: TextStyle(
                          fontSize: screenHeight * app_heights.height20),
                    ),
                    // Icons for logout user
                    IconButton(
                      onPressed: () async {
                        await signOut();
                      },
                      icon: Icon(
                        Icons.logout_outlined,
                        size: screenHeight * app_heights.height20,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * app_heights.height20,),

                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow( //<-- SEE HERE
                        color: Colors.greenAccent,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenHeight * app_heights.height20), //<-- SEE HERE
                    ),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:  screenWidth * app_widths.width16, vertical: screenHeight * app_heights.height16,),
                        child: Row(
                          children: [
                           
                            SizedBox(width: screenWidth * app_widths.width16,),
                  
                            Flexible(
                              child: SizedBox(
                                height: screenHeight * app_heights.height152,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("The most important thing is to keep the most important thing the most important thing.", style: TextStyle( fontSize: screenHeight * app_heights.height20,),),
                                    
                                    (previewButton) 
                                      ?  ElevatedButton(child: Text("Preview", style: TextStyle(fontSize: screenHeight * app_heights.height18),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetailScreen(email: user!.email.toString(),),));},)
                                      : ElevatedButton(child: Text("Register your project", style: TextStyle(fontSize: screenHeight * app_heights.height18),),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisrationFormPage(userUid: user!.uid),),);},)
                                  ],
                                ),
                            )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: screenHeight * app_heights.height30,),

                CarouselSlider(
                  items: imageList.map((imagePath) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)), 
                          color: Colors.white12, 
                          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)),
                      ),
                    );
                  }).toList(),

                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    padEnds: true,
                    viewportFraction: 1,  
                    autoPlayInterval:
                        Duration(seconds: 2), // Adjust the interval as needed
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: screenHeight * app_heights.height80,
                ),

                
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) =>
                //                 StudentDetailScreen(email: user!.email.toString()),
                //           ));
                //     },
                //     child: Text(
                //       "Register Student Info!",
                //     ))
              ],
            ),
          ),
        ),
      
      
      ),
    );
  }
}