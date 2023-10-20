import 'package:flutter/material.dart';

class AppSnackBar{

  static showSnackBar({required BuildContext context, required String text}) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: 2), // Optional: Control how long the SnackBar stays visible
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}