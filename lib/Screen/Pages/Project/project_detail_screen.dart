import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class ProjectPhotoWidget extends StatefulWidget {
  
  const ProjectPhotoWidget({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<ProjectPhotoWidget> createState() => _ProjectPhotoWidgetState();
}

class _ProjectPhotoWidgetState extends State<ProjectPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Text(
          'Project Name:',
          style: TextStyle(fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold),
        ),
        Text(
          "projectName",
          style: TextStyle(fontSize: screenHeight * app_heights.height20,),
        ),

        SizedBox(height: screenHeight * app_heights.height16),

        Text(
          'Category:',
          style: TextStyle(fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold),
        ),
        Text(
          "category",
          style: TextStyle(fontSize: screenHeight * app_heights.height20,),
        ),

        SizedBox(height: screenHeight * app_heights.height16),

        Text(
          'Abstract:',
          style: TextStyle(fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 250,
          child: SingleChildScrollView(
            child: Text(
              "abstract",
              style: TextStyle(fontSize: screenHeight * app_heights.height20,),
            ),
          ),
        ),
      ],
    );
  }
}
