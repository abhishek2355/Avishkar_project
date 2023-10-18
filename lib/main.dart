import 'package:avishkar/Screen/login.dart';
import 'package:avishkar/Screen/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/LoginScreen': (context) => LoginScreen(),
      },
    );
  }
}
