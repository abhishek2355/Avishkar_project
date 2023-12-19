import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class HomeHelper {
  void showLogoutSnackbar(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth =
        media.size.width - media.padding.left - media.padding.right;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        content: Container(
          decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          height: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * app_widths.width17,
                    vertical: screenHeight * app_heights.height20),
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * app_heights.height20),
                ),
              ),
              const Divider(),
              Text(
                'Are you sure you want to logout?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * app_heights.height16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Perform logout action
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30.0), // Adjust the value as needed
                      ),
                    ),
                    child: Container(
                      width: screenWidth *
                          app_widths.width120, // Adjust the width as needed
                      height: screenHeight *
                          app_heights.height40, // Adjust the height as needed
                      alignment: Alignment.center,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * app_heights.height16),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Perform logout action
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30.0), // Adjust the value as needed
                      ),
                    ),
                    child: Container(
                      width: screenWidth *
                          app_widths.width120, // Adjust the width as needed
                      height: screenHeight *
                          app_heights.height40, // Adjust the height as needed
                      alignment: Alignment.center,
                      child: Text(
                        'Yes, Logout',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * app_heights.height16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.greenAccent,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
