import 'dart:developer';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_page_apis.dart';
import 'package:avishkar/Screen/Pages/Registration/widget/preview_screen.dart';
import 'package:avishkar/Screen/Pages/Registration/widget/registration_form.dart';
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
    signOut() async {
      await FirebaseAuth.instance.signOut();
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
                                fontSize: screenHeight * app_heights.height16),
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
                                  // Image.asset("assets/images/dbatu_logo.png",
                                  //     height: screenHeight * 110 / 926),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(25)
                                    ),
                                    height: screenHeight * 110 / 926, 
                                    width: screenWidth * 95 / 428
                                  ),

                                  SizedBox(
                                    width: screenWidth * app_widths.width10,
                                  ),

                                  Flexible(
                                    child: SizedBox(
                                      height: screenHeight * app_heights.height152,
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Text("Aavishkar 2023-24",
                                              style: TextStyle(
                                                fontSize: screenHeight * app_heights.height25,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                        
                                            Text(
                                              "With the view of promoting research among the students, the then Hon'ble Governor of Maharashtra and the Chancellor of the Universities in the State of Maharashtra initiated Aavishkar.",
                                              style: TextStyle(
                                                fontSize: screenHeight * app_heights.height16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * app_heights.height30,
                      ),

                      Container(
                        decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, // Shadow color
                            blurRadius: 5, // Spread of the shadow
                            offset: Offset(0, 2), // Offset of the shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                        height: screenHeight * app_heights.height240,
                        width: screenWidth,
                        child: (previewButton)
                            ? SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenHeight *
                                                app_heights.height10,
                                            vertical: 7),
                                        child: Text(
                                          "Aavishkar Objective's",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenHeight *
                                                  app_heights.height20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              screenWidth * app_widths.width19,
                                          vertical:
                                              screenHeight * app_heights.height5),
                                      child: Text(
                                        "# To identy the hidden innovative scientific talents and capacities of the students and provide them opportunities to inculcate research aptitude.",
                                        style: TextStyle(
                                            fontSize: screenHeight *
                                                app_heights.height16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              screenWidth * app_widths.width19,
                                          vertical:
                                              screenHeight * app_heights.height5),
                                      child: Text(
                                        "# To create competitiveness among the researchers to enhance the quality of the research.",
                                        style: TextStyle(
                                            fontSize: screenHeight *
                                                app_heights.height16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              screenWidth * app_widths.width19,
                                          vertical:
                                              screenHeight * app_heights.height5),
                                      child: Text(
                                        "# To appreciate the researchers and provide financial aid in the form of fellowship to promote the research.",
                                        style: TextStyle(
                                            fontSize: screenHeight *
                                                app_heights.height16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                            )
                            : SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * app_widths.width19,
                                        vertical: screenHeight *app_heights.height15,
                                      ),
                                      child: Text(
                                        "Step's to Register",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * app_heights.height21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * app_widths.width19,
                                      vertical: screenHeight * app_heights.height10
                                    ),
                                    child: Text("Steps 1 : Fill Personal details",
                                      style: TextStyle(
                                        fontSize: screenHeight * app_heights.height19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * app_widths.width19,
                                      vertical: screenHeight * app_heights.height10
                                    ),
                                    child: Text("Steps 2 : Fill Academics details",
                                      style: TextStyle(
                                        fontSize: screenHeight * app_heights.height19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * app_widths.width19,
                                      vertical: screenHeight * app_heights.height10,
                                    ),
                                    child: Text("Steps 3 : Fill Project details",
                                      style: TextStyle(
                                        fontSize: screenHeight * app_heights.height19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * app_widths.width19,
                                      vertical: screenHeight * app_heights.height10,
                                    ),
                                    child: Text(
                                      "Steps 4 : Submit",
                                      style: TextStyle(
                                        fontSize: screenHeight * app_heights.height19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ),
                      SizedBox(
                        height: screenHeight * app_heights.height20,
                      ),
                      (previewButton)
                          ? Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey, // Shadow color
                                      blurRadius: 5, // Spread of the shadow
                                      offset:
                                          Offset(0, 2), // Offset of the shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              height: screenHeight * app_heights.height50,
                              width: screenWidth,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.greenAccent)),
                                child: Text(
                                  "View Your Information",
                                  style: TextStyle(
                                      fontSize:
                                          screenHeight * app_heights.height22,
                                      color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            StudentDetailScreen(
                                          email: user!.email.toString(),
                                        ),
                                      ));
                                },
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey, // Shadow color
                                      blurRadius: 5, // Spread of the shadow
                                      offset:
                                          Offset(0, 2), // Offset of the shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              height: screenHeight * app_heights.height50,
                              width: screenWidth,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.greenAccent)),
                                child: Text(
                                  "Register your Project",
                                  style: TextStyle(
                                      fontSize:
                                          screenHeight * app_heights.height22,
                                      color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisrationFormPage(
                                          userUid: user!.uid),
                                    ),
                                  );
                                },
                              ),
                            ),

                      SizedBox(
                        height: screenHeight * app_heights.height30,
                      ),

                      CarouselSlider(
                        items: imageList.map((imagePath) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * app_widths.width8,
                                vertical: screenHeight * app_heights.height8),
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
                        height: screenHeight * app_heights.height30,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
