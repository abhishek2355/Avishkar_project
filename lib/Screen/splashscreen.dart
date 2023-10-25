import 'package:avishkar/Constants/app_strings.dart' as app_strings;
import 'package:avishkar/Screen/Authentication/widget/auth_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AuthPage(),));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 1.0, end: 2.0),
            duration: const Duration(seconds: 2),
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: Image.asset(app_strings.universityLogoImagePath),
              );
            },
          ),
        ),
      ),
    );
  }
}
