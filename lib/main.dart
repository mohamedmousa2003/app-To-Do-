import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/pages/home/add_task.dart';
import 'package:todo/pages/home/home_view.dart';
import 'package:todo/pages/onboarding/onboarding_view.dart';
import 'package:todo/pages/splash_Screen/splash_screen.dart';

import 'core/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            title: 'TO DO',
            debugShowCheckedModeBanner: false,
            theme: ThemeApplications.themeLight,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => const SplashScreen(),
              OnboardingView.routeName: (context) => OnboardingView(),
              HomeView.routeName: (context) => HomeView(),
              //RegisterView.routeName: (context) => RegisterView(),
              AddTask.routeName: (context) => AddTask(),
              //LoginView.routeName: (context) => LoginView(),
            },
          );
        });
  }
}
/*
 fonst size --> sp
 width --> w
 height --> h
 */
