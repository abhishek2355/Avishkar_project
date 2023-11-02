import 'dart:developer';

import 'package:avishkar/Screen/Pages/Registration/apis/registration_model.dart';
import 'package:avishkar/Screen/Pages/Registration/apis/registration_page_apis.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({super.key, required this.email});
  final String email;

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  bool isLoading = false;
  RegistrationModel? userData;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    try {
      userData = await RegistrationAPI.fetchData(widget.email);
      log("${userData}");
      setState(() {
        isLoading = true;
      });
    } catch (e) {
      log('${e}');
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

    return Scaffold(
        body: (isLoading)
            ? Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            screenHeight * app_heights.height60),
                        bottomRight: Radius.circular(
                            screenHeight * app_heights.height60),
                      ),
                      color: Colors.teal,
                    ),
                    height: screenHeight * 160 / 926,
                    child: Stack(
                      children: [
                        Positioned(
                          top: screenHeight * app_heights.height60,
                          left: screenWidth * 170 / 428,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  screenHeight * app_heights.height15)),
                              color: const Color.fromARGB(255, 11, 217, 159),
                            ),
                            height: screenHeight * app_heights.height25,
                            width: screenWidth * 90 / 428,
                            child: Center(
                              child: Text(
                                "Student Info",
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height15,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * app_heights.height75,
                          left: screenWidth * app_widths.width40,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: screenHeight * app_heights.height40,
                            backgroundImage: const NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVWu2v6yAJRzw2vuA8SGqCt-b3A-Ydqz8udQiaZ_N6CgIYYCEJziD01VvmYBb3sefvq2E&usqp=CAU"),
                            // backgroundImage: AssetImage('assets/student_avatar.png'),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 110 / 926,
                          left: screenWidth * 130 / 428,
                          child: Text(
                            "${userData!.saveFname} ${userData!.saveLname}",
                            style: TextStyle(
                                fontSize: screenHeight * app_heights.height30,
                                color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * app_heights.height32,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: screenHeight * app_heights.height25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * app_heights.height10),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * app_widths.width16,
                          vertical: screenHeight * app_heights.height16),
                      children: [
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                'Email'),
                            subtitle: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                userData!.saveEmail),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                'Mobile'),
                            subtitle: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                userData!.saveMobile),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                'Father/Mother Name'),
                            subtitle: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                userData!.saveParentName),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                'Address'),
                            subtitle: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                userData!.saveAddress),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                'Department'),
                            subtitle: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                userData!.saveDept),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                'Project Title'),
                            subtitle: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                userData!.saveProject),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                'Discipline'),
                            subtitle: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                userData!.saveCategory),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                'Project Abstract'),
                            subtitle: Text(
                                style: TextStyle(
                                    fontSize:
                                        screenHeight * app_heights.height25),
                                userData!.saveAbstract),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
