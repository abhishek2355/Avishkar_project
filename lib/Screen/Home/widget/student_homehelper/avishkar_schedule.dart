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
                IconButton(
                  onPressed: (){Navigator.pop(context);}, 
                  icon: Icon(Icons.arrow_back, size: screenHeight * app_heights.height25, color: Colors.black,),
                ),
        
                SizedBox(width: screenWidth * app_widths.width56,),
        
                Text(
                  "Aavishkar AvishkarSchedule",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * app_heights.height22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
        
              ],
            ),
        
            SizedBox(height: screenHeight * app_heights.height20,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
              child: Container(
                height: screenHeight * app_heights.height209,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(color: Colors.redAccent),
                  image: DecorationImage(
                    image: const AssetImage("assets/images/schedule.jpg"),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.softLight,)
                  ),
                ),
              ),
            ),

            const Divider(),
        
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16,),
              child: SizedBox(
                child: Table(
                  border: TableBorder.all(color: Colors.black),
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Sr. No', style: TextStyle(fontSize: screenHeight * app_heights.height18, fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Event', style: TextStyle(fontSize: screenHeight * app_heights.height18, fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Place', style: TextStyle(fontSize: screenHeight * app_heights.height18, fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Date', style: TextStyle(fontSize: screenHeight * app_heights.height18, fontWeight: FontWeight.bold),),
                        ),
                      ]
                    ),
              
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('1', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Avishkar Zonal Round', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Pune', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('26-Nov-2023', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                      ],
                    ),
              
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Avishkar University Round', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('DBATU', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('24-Dec-2023', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                      ],
                    ),
              
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('3', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Avishkar State Round', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('--', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('--', style: TextStyle(fontSize: screenHeight * app_heights.height15),),
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