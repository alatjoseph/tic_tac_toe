import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        //Add a background image to the entire screen
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/assets/splash.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
