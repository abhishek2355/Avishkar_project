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
            // AppBar of the screen.
            Row(
              children: [
                // Back Button.
                IconButton(
                  onPressed: (){Navigator.pop(context);}, 
                  icon: Icon(Icons.arrow_back, size: screenHeight * app_heights.height25, color: Colors.black,),
                ),

                // SizedBox with the width 56.
                SizedBox(width: screenWidth * app_widths.width50),
        
                // Title of the AppBar.
                Text(
                  "Project Registration Process",
                  style: TextStyle(fontFamily: "AppFont",
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
                  // Image of the register process.
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
                          image: const AssetImage("assets/images/registration.jpg"),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.softLight,)
                        ),
                      ),
                    ),
                  ),
              
                  // Divider
                  const Divider(),
                  
                  // Step -- 1
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Step 1:",
                            style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height20, color: Colors.black),
                          ),
                          TextSpan(
                            text: " All the fields are mandatory. In case any field is not applicable, enter “NA”.",
                            style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                          )
                        ]
                      ),
                    ),
                  ),

                  // SizedBox with the height 10.
                  SizedBox(height: screenHeight * app_heights.height10,),
              
                  // Step -- 2
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Step 2:",
                            style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height20, color: Colors.black),
                          ),
                          TextSpan(
                            text: " On the home page click on the register project button. ",
                            style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                          )
                        ]
                      ),
                    ),
                  ),

                  // SizedBox with the height 10.
                  SizedBox(height: screenHeight * app_heights.height10,),
              
                  // Step -- 3
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Step 3:",
                            style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height20, color: Colors.black),
                          ),
                          TextSpan(
                            text: " Once you register the project on the Avishkar application the same button will be converted into the view your information.",
                            style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                          )
                        ]
                      ),
                    ),
                  ),

                  // SizedBox with the height 10.
                  SizedBox(height: screenHeight * app_heights.height10,),
              
                  // Step -- 4
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Step 4:",
                            style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height20, color: Colors.black),
                          ),
                          TextSpan(
                            text: " Once you submit the project, you can't change any field in it.",
                            style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                          )
                        ]
                      ),
                    ),
                  ),

                  // SizedBox with the height 10.
                  SizedBox(height: screenHeight * app_heights.height10,),

                  // Step - 5
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Step 5:",
                            style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height20, color: Colors.black),
                          ),
                          TextSpan(
                            text: " Once you click on the register project button, fill the all personal details.",
                            style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                          )
                        ]
                      ),
                    ),
                  ),

                  // SizedBox with the height 10.
                  SizedBox(height: screenHeight * app_heights.height10,),

                  // Step - 6
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width16),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Step 6:",
                            style: TextStyle(fontFamily: "AppFont",fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height20, color: Colors.black),
                          ),
                          TextSpan(
                            text: " After click on the save and next button fill the required fields and submit the prject.",
                            style: TextStyle(fontFamily: "AppFont",fontSize: screenHeight * app_heights.height18, color: Colors.black),
                          )
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )               
      ),
    );
  }
}