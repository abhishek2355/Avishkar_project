import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class MyImageCarousel extends StatefulWidget {
  const MyImageCarousel({
    super.key, 
    required this.imageUrl, 
    required this.buttonName,
    this.onTap
  });

  final String imageUrl;
  final Function()? onTap;
  final String buttonName;

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
            height: screenHeight * app_heights.height152,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(color: Colors.redAccent),
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Button over the images.
          Positioned(
            bottom: screenHeight * app_heights.height10,
            right: screenWidth * app_widths.width10,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(screenHeight * app_heights.height10)),
                  )
                ),
                backgroundColor:MaterialStateProperty.all(Colors.cyan),
              ),
              onPressed: widget.onTap, 
              child: Text(widget.buttonName, style: TextStyle(fontFamily: "AppFont",color: Colors.white, fontSize: screenHeight * app_heights.height18),)
            ),
          ),
        ],
      ),
    );
  }
}
