import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class AvishkarObjectives extends StatefulWidget {
  const AvishkarObjectives({super.key});

  @override
  State<AvishkarObjectives> createState() => _AvishkarObjectivesState();
}

class _AvishkarObjectivesState extends State<AvishkarObjectives> {
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
            // App Bar of the Objective's screen.
            Row(
              children: [
                // Back icon
                IconButton(
                  onPressed: (){Navigator.pop(context);}, 
                  icon: Icon(Icons.arrow_back, size: screenHeight * app_heights.height25, color: Colors.black,),
                ),

                // SizedBox with width 56
                SizedBox(width: screenWidth * app_widths.width56,),

                // Title of the appBar.
                Text(
                  "Aavishkar Objective's",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * app_heights.height22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
        
              ],
            ),
        
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image of objectives.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: Container(
                      height: screenHeight * app_heights.height209,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: Colors.redAccent),
                        image: DecorationImage(
                          image: const AssetImage("assets/images/objective.jpg"),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.softLight,)
                        ),
                      ),
                    ),
                  ),

                  // Divider
                  const Divider(),
                  
                  // First Objectives.
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:screenWidth * app_widths.width19,
                      vertical:screenHeight * app_heights.height5
                    ),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "•",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height25, color: Colors.black),
                          ),
                          TextSpan(
                            text: "  To identy the hidden innovative scientific talents and capacities of the students and provide them opportunities to inculcate research aptitude.",
                            style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.black),
                          )
                        ]
                      ),
                    ),
                  ),

                  // Second objectives.
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width19,
                      vertical: screenHeight * app_heights.height5,
                    ),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "•",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height25, color: Colors.black),
                          ),
                          TextSpan(
                            text: "  To create competitiveness among the researchers to enhance the quality of the research.",
                            style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.black),
                          )
                        ]
                      ),
                    ),
                  ),
                  
                  // Third objectives.
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * app_widths.width19,
                      vertical: screenHeight * app_heights.height5
                    ),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "•",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height25, color: Colors.black),
                          ),
                          TextSpan(
                            text: "  To appreciate the researchers and provide financial aid in the form of fellowship to promote the research.",
                            style: TextStyle(fontSize: screenHeight * app_heights.height18, color: Colors.black),
                          )
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}