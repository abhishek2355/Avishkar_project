import 'dart:developer';
import 'package:avishkar/Screen/Authentication/apis/authentication_api.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_page_apis.dart';
import 'package:avishkar/Screen/Pages/Registration/widget/registrationForm.dart';
import 'package:avishkar/Screen/Pages/Registration/widget/studentRegInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
  double totalPercentage = 0;
  double sum = 0;

  List<String> imageList = [
    "assets/images/Dbatu_1.jpg",
    "assets/images/Dbatu_2.png",
    "assets/images/Dbatu_3.jpg",
    "assets/images/Dbatu_4.jpeg",
    "assets/images/Dbatu_5.webp",
  ];

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    _getData();
    super.initState();
  }

  _getData() async {
    try {
      bool isSuccessfull = await RegistrationAPI.isProjectRegisterSuccessfully(
          userUid: user!.uid);
      if (isSuccessfull) {
        setState(() {
          previewButton = true;
        });
        RegistrationModel? studentsMark =
            await RegistrationAPI.fetchData(user!.email.toString());
        log("${studentsMark!.marks}");
        List<dynamic> test = studentsMark.marks;

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
            ? const Center(
                child: CircularProgressIndicator(),
              )
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
                          Text(
                            user!.email.toString(),
                            style: TextStyle(
                                fontSize: screenHeight * app_heights.height20),
                          ),
                          // Icons for logout user
                          IconButton(
                            onPressed: () async {
                              signOut();
                            },
                            icon: Icon(
                              Icons.logout_outlined,
                              size: screenHeight * app_heights.height20,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: screenHeight * app_heights.height20,
                      ),

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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenHeight *
                                app_heights.height20), //<-- SEE HERE
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white10),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * app_widths.width16,
                                vertical: screenHeight * app_heights.height16,
                              ),
                              child: Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 42.0,
                                    lineWidth: screenWidth * app_widths.width10,
                                    percent: totalPercentage / 100,
                                    center: Text(
                                      "${(totalPercentage).toStringAsFixed(2)} %",
                                      style: TextStyle(
                                          fontSize: screenHeight *
                                              app_heights.height25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    progressColor: Colors.green,
                                  ),
                                  SizedBox(
                                    width: screenWidth * app_widths.width16,
                                  ),
                                  Flexible(
                                      child: SizedBox(
                                    height:
                                        screenHeight * app_heights.height152,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "The most important thing is to keep the most important thing the most important thing.",
                                          style: TextStyle(
                                            fontSize: screenHeight *
                                                app_heights.height20,
                                          ),
                                        ),
                                        (previewButton)
                                            ? ElevatedButton(
                                                child: Text(
                                                  "Preview",
                                                  style: TextStyle(
                                                      fontSize: screenHeight *
                                                          app_heights.height18),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            StudentDetailScreen(
                                                          email: user!.email
                                                              .toString(),
                                                        ),
                                                      ));
                                                },
                                              )
                                            : ElevatedButton(
                                                child: Text(
                                                  "Register your project",
                                                  style: TextStyle(
                                                      fontSize: screenHeight *
                                                          app_heights.height18),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegisrationFormPage(
                                                              userUid:
                                                                  user!.uid),
                                                    ),
                                                  );
                                                },
                                              )
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: screenHeight * app_heights.height30,
                      ),

                      CarouselSlider(
                        items: imageList.map((imagePath) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    screenHeight * app_heights.height25)),
                                color: Colors.white12,
                                image: DecorationImage(
                                    image: AssetImage(imagePath),
                                    fit: BoxFit.fill),
                              ),
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
                          autoPlayInterval: const Duration(seconds: 2),
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
