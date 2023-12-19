import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class RegistrationRule extends StatefulWidget {
  const RegistrationRule({super.key});

  @override
  State<RegistrationRule> createState() => _RegistrationRuleState();
}

class _RegistrationRuleState extends State<RegistrationRule> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (){Navigator.pop(context);}, 
                  icon: Icon(Icons.arrow_back, size: screenHeight * app_heights.height25, color: Colors.black,),
                ),
        
                SizedBox(width: screenWidth * app_widths.width56,),
        
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
                          image: const AssetImage("assets/images/registration.jpg"),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.softLight,)
                        ),
                      ),
                    ),
                  ),

                  const Divider(),
                  
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
          ],
        )
                      
      )
    );
  }
}