import 'package:flutter/material.dart';
import 'package:todo/pages/onboarding/onboarding_one_screen.dart';
import 'package:todo/pages/splash_Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        OnboardingOneScreen.routeName: (context) => OnboardingOneScreen(),
      },
    );
  }
}
