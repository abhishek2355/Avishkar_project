
import 'package:flutter/material.dart';

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
