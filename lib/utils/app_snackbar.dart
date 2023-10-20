import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class AlphaSnackBarUtilities {

  /// Utility method to show the snack bar on the screen.
  /// Parameters:
  ///  * [context] - context of the parent widget.
  ///  * [snackMessage] - A string message to show on the snack bar.
  ///  * [snackIcon] - Icon to show it on the screen.
  static showSnackBar({required BuildContext context, required String snackMessage, required IconData snackIcon}) {
    // Medial query
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    
    // Flushbar
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 3),
      icon: Icon(snackIcon, color: Colors.white,size: screenHeight * app_heights.height40,),
      messageText:Text( snackMessage ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenHeight * app_heights.height25,color: Colors.white,)),
      borderRadius: BorderRadius.circular(25),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,

      backgroundGradient: LinearGradient(
        colors: [
          Colors.red.shade500,
          Colors.red.shade300,
          Colors.red.shade100
        ],
        stops:const [0.4, 0.7, 1],
      ),
      boxShadows:const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(10, 10),
          blurRadius: 10,
        ),
      ],        
    ).show(context);
  }
}