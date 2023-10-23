import 'package:avishkar/Screen/Authentication/apis/authentication_api.dart';
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
  List<String> imageList = [
    "https://upload.wikimedia.org/wikipedia/en/6/64/BATU_logo.png",
    "https://dbatu.ac.in/wp-content/uploads/2016/12/KP5559298cf38e2.jpg",
    "https://avishkarrealty.com/images/about/about-us-discription-image.jpg",
    "https://dbatu.ac.in/wp-content/uploads/2023/08/dbatu1-1-1024x305-1.png",
    "https://www.collegebatch.com/static/clg-gallery/dr-babasaheb-ambedkar-technological-university-lonere-256752.jpg"
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
        body: SingleChildScrollView(
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

                CarouselSlider(
                  items: imageList.map((imagePath) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * app_widths.width16),
                      child: Image.network(
                        imagePath,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
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

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisrationFormPage(userUid: user!.uid),
                          ));
                    },
                    child: Text(
                      "Register yourself!",
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StudentDetailScreen(email: user!.email.toString()),
                          ));
                    },
                    child: Text(
                      "Register Student Info!",
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
