
import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class TextFormFields extends StatelessWidget {
  const TextFormFields({
    super.key,
    required this.hintText, 
    required this.labelText, 
    this.icons,
  });

  final String hintText;
  final String labelText;
  final IconData? icons;
  

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return SizedBox(
      height: screenHeight * app_heights.height60,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height20),
          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: screenHeight * app_heights.height20),
          prefixIcon: (icons != null) ? Icon(icons, size: screenHeight * app_heights.height25, color: Colors.black,) : null,
          contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width10),
          border:  OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}