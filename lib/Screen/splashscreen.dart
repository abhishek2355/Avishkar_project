import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/LoginScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 1.0, end: 2.0),
            duration: Duration(seconds: 2),
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: Image.asset('assets/images/dbatu.png'),
              );
            },
          ),
        ),
      ),
    );
  }
}
