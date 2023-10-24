import 'package:flutter/material.dart';
import 'package:avishkar/Constants/app_heights.dart' as app_heights;

class MarksEvaluationScreen extends StatefulWidget {
  @override
  _MarksEvaluationScreenState createState() => _MarksEvaluationScreenState();
}

class _MarksEvaluationScreenState extends State<MarksEvaluationScreen> {
  // Initialize ratings for each parameter
  double innovationRating = 0.0;
  double originalityRating = 0.0;
  double presentationSkillsRating = 0.0;
  double depthOfKnowledgeRating = 0.0;
  double productabilityRating = 0.0;

  // Calculate the total marks
  double calculateTotalMarks() {
    return innovationRating +
        originalityRating +
        presentationSkillsRating +
        depthOfKnowledgeRating +
        productabilityRating;
  }

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var media = MediaQuery.of(context);
    final double screenHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    final double screenWidth =
        media.size.width - media.padding.left - media.padding.right;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Marks Evaluation'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: screenHeight * app_heights.height25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ParameterWidget("Innovation", (value) {
              setState(() {
                innovationRating = value;
              });
            }),
            ParameterWidget("Originality", (value) {
              setState(() {
                originalityRating = value;
              });
            }),
            ParameterWidget("Presentation Skills", (value) {
              setState(() {
                presentationSkillsRating = value;
              });
            }),
            ParameterWidget("Depth of Knowledge", (value) {
              setState(() {
                depthOfKnowledgeRating = value;
              });
            }),
            ParameterWidget("Productability", (value) {
              setState(() {
                productabilityRating = value;
              });
            }),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Set the background color to teal
              ),
              onPressed: () {
                // Handle submission or calculation of marks here
                final totalMarks = calculateTotalMarks();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.teal,
                    content: Text(
                      'Total Marks: $totalMarks',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
              child: Text("Submit", style: TextStyle(color: Colors.white,fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class ParameterWidget extends StatefulWidget {
  final String parameterName;
  final ValueChanged<double> onRatingChanged;

  ParameterWidget(this.parameterName, this.onRatingChanged);

  @override
  _ParameterWidgetState createState() => _ParameterWidgetState();
}

class _ParameterWidgetState extends State<ParameterWidget> {
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.parameterName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                _rating.toStringAsFixed(1),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Slider(
            activeColor: Color.fromARGB(255, 104, 205, 107),
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
