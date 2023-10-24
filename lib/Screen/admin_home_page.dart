import 'dart:io';

import 'package:avishkar/Screen/projectinfoscreen.dart';
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late String filterValue = "Engineering";
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth =
        media.size.width - media.padding.left - media.padding.right;

    List<String> filteritem = [
      "Engineering",
      "Agriculture",
      "Pharmacy",
      "Biotechnical",
      "Aerospace"
    ];

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(screenHeight * app_heights.height8),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      exit(0);
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded)),
                // Icon(Icons.filter_list_outlined),
                DropdownButton(
                  value: filterValue,
                  onChanged: (newValue) {
                    setState(() {
                      filterValue = newValue!;
                    });
                  },
                  items: filteritem.map((filteritem) {
                    return DropdownMenuItem(
                      value: filteritem,
                      child: Text(filteritem),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * app_heights.height10,
            ),
            SizedBox(
              height: screenHeight,
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 60,
                      ),
                      title: Text("Student Name"),
                      subtitle: Text("Project Title"),
                      trailing: ElevatedButton(
                        child: Text("Accept"),
                        onPressed: () {
                          Text("Accepted");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectDetailsScreen(),
                              ));
                        },
                      ),
                    );
                  } else {
                    return ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 60,
                      ),
                      title: Text("Student Name"),
                      subtitle: Text("Project Title"),
                      trailing: ElevatedButton(
                        child: Text("Rejected"),
                        onPressed: () {},
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
