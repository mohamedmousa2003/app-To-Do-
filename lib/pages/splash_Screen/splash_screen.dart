import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/core/app_colors.dart';
import 'package:todo/pages/onboarding/onboarding_view.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "splash";
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    });
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Image.asset("assets/images/splash.png"),
      ),
    );
  }
}
