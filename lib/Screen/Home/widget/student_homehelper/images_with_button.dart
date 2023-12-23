import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;


class MyImageCarousel extends StatefulWidget {
  const MyImageCarousel({
    super.key, 
    required this.iconName, 
    required this.headingText,
    required this.subText,
    required this.color_1, 
    required this.color_2,
    this.onTap, 
  });

  final IconData iconName;
  final Function()? onTap;
  final String headingText;
  final String subText;
  final Color color_1;
  final Color color_2;

  @override
  // ignore: library_private_types_in_public_api
  _MyImageCarouselState createState() => _MyImageCarouselState();
}

class _MyImageCarouselState extends State<MyImageCarousel> {
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth = media.size.width - media.padding.left - media.padding.right;

    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          // Image container 
          Container(
            height: screenHeight * app_heights.height210,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin:  Alignment.topLeft,
                end:  AlignmentDirectional.bottomEnd,
                colors: [
                  widget.color_1,
                  widget.color_2,
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * app_widths.width25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: Text(widget.headingText, style: TextStyle(color: Colors.white, fontFamily: "AppFont", fontSize: screenHeight * app_heights.height25),)),
                        Flexible(child: Text(widget.subText, style: TextStyle(color: Colors.white, fontFamily: "AppFont", fontSize: screenHeight * app_heights.height18),)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Icon(widget.iconName, size: screenHeight * app_heights.height60, color: Colors.white,),
                  )

                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
