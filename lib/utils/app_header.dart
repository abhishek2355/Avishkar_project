import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class AppHeaderBar extends StatefulWidget {
  const AppHeaderBar({super.key});

  @override
  State<AppHeaderBar> createState() => _AppHeaderBarState();
}

class _AppHeaderBarState extends State<AppHeaderBar> {
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;

    return Container(
      height: screenHeight * app_heights.height210,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo of DBATU
          Image.asset('assets/images/dbatu_logo.png', height: screenHeight * app_heights.height152,),

          // Name of the University.
          Flexible(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * app_heights.height32,),
                  Text('Dr. Babasaheb Ambedkar Technological University', style: TextStyle(fontSize: screenHeight * app_heights.height30, fontWeight: FontWeight.bold),),
                  Text('Lonere-402103 Tal-Mangaon Dist- Raigad(M.S.) India', style: TextStyle(fontSize: screenHeight * app_heights.height12, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}