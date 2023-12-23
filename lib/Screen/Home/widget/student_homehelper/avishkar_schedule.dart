import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class AvishkarSchedule extends StatefulWidget {
  const AvishkarSchedule({super.key});

  @override
  State<AvishkarSchedule> createState() => _AvishkarScheduleState();
}

class _AvishkarScheduleState extends State<AvishkarSchedule> {
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Row for the
            Row(
              children: [
                // Back icon 
                IconButton(
                  onPressed: (){Navigator.pop(context);}, 
                  icon: Icon(Icons.arrow_back, size: screenHeight * app_heights.height25, color: Colors.black,),
                ),
                
                // SizedBox with the width 56
                SizedBox(width: screenWidth * app_widths.width56,),

                // Title of AppBar.
                Text(
                  "Aavishkar Schedule",
                  style: TextStyle(fontFamily: "AppFont",
                    color: Colors.black,
                    fontSize: screenHeight * app_heights.height22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
        
              ],
            ),
        
            // SizedBox with height 20.
            SizedBox(height: screenHeight * app_heights.height20,),

            // Table of the schedule 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16,),
              child: SizedBox(
                child: Table(
                  border: TableBorder.all(color: Colors.black),
                  children: [
                    // First Row.
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Sr. No', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Event', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Place', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Date', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, fontWeight: FontWeight.bold),),
                        ),
                      ]
                    ),
              
                    // Second Row.
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('1', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Avishkar Zonal Round', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('--', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('26-Nov-2023', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                      ],
                    ),
              
                    // Third Row.
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Avishkar University Round', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('--', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('24-Dec-2023', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                      ],
                    ),
              
                    // Fourt Row.
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('3', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Avishkar State Round', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('--', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('1st week of Jan 2024', style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height15),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}