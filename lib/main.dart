import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/registration.dart';
import 'package:flutter_application_1/screens/splash.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/', // Specifies the initial route of the application
        routes: {
          '/': (context) =>
              const SplashScreen(), // Defines the route '/' to show SplashScreen widget
          '/main': (context) =>
              Registration(), // Defines the route '/main' to show MainScreen widget
        });
  }
}
