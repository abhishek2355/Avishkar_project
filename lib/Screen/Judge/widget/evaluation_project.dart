import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class EvaluationProjectPhotoWidget extends StatefulWidget {
  
  const EvaluationProjectPhotoWidget({
    super.key, 
    required this.imagePath, 
    required this.projectName, 
    required this.category, 
    required this.abstract
  });
  
  final String imagePath;
  final String projectName;
  final String category;
  final String abstract;

  @override
  State<EvaluationProjectPhotoWidget> createState() => _EvaluationProjectPhotoWidgetState();
}

class _EvaluationProjectPhotoWidgetState extends State<EvaluationProjectPhotoWidget> {
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
          height: screenHeight * app_heights.height209,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(height: screenHeight * app_heights.height20,),

        Text(
          'Project Name:',
          style: TextStyle(fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold),
        ),

        Text(
          widget.projectName,
          style: TextStyle(fontSize: screenHeight * app_heights.height20,),
        ),

        SizedBox(height: screenHeight * app_heights.height16),

        Text(
          'Category:',
          style: TextStyle(fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.category,
          style: TextStyle(fontSize: screenHeight * app_heights.height20,),
        ),

        SizedBox(height: screenHeight * app_heights.height16),

        Text(
          'Abstract:',
          style: TextStyle(fontSize: screenHeight * app_heights.height20, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.abstract,
          style: TextStyle(fontSize: screenHeight * app_heights.height20,),
        ),
      ],
    );
  }
}
