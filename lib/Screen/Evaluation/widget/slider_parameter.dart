import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class ParameterWidget extends StatefulWidget {
  const ParameterWidget({
    super.key, 
    required this.parameterName, 
    required this.onRatingChanged
  });

  final String parameterName;
  final ValueChanged<double> onRatingChanged;

  @override
  State<ParameterWidget> createState() => _ParameterWidgetState();
}

class _ParameterWidgetState extends State<ParameterWidget> {
  double _rating = 0.0;
  

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight = media.size.height - media.padding.top - media.padding.bottom;
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * app_heights.height20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.parameterName,
                style: TextStyle(fontSize: screenHeight * app_heights.height22, fontWeight: FontWeight.bold),
              ),
              Text(
                _rating.toStringAsFixed(1),
                style: TextStyle(fontSize: screenHeight * app_heights.height16),
              ),
            ],
          ),
      
          Slider(
            activeColor: const Color(0xFF8e3de2),
            value: _rating,
            onChanged: (value) {
              setState(() {
                _rating = value;
                widget.onRatingChanged(value);
              });
            },
            min: 0,
            max: 10,
            divisions: 10,
            label: "$_rating",
          ),
        ],
      ),
    );
  }
}