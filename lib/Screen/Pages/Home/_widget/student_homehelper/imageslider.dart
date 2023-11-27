import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;
import 'package:avishkar/Constants/app_widths.dart' as app_widths;

class MyImageCarousel extends StatefulWidget {
  @override
  _MyImageCarouselState createState() => _MyImageCarouselState();
}

class _MyImageCarouselState extends State<MyImageCarousel> {
  int currentIndex = 0;
  List<String> imageList = [
    "assets/images/Dbatu_1.jpg",
    "assets/images/Dbatu_2.png",
    "assets/images/Dbatu_3.jpg",
    "assets/images/Dbatu_4.jpeg",
    "assets/images/Dbatu_5.webp",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return CarouselSlider(
      items: imageList.map((imagePath) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * app_widths.width8,
            vertical: screenHeight * app_heights.height8,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(screenHeight * app_heights.height25),
              ),
              color: Colors.white12,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        padEnds: true,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 2),
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
