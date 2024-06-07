import 'package:flutter/material.dart';
import 'package:todo/core/app_colors.dart';

class ThemeApplications {
  static bool isDark = true;
  static ThemeData themeLight = ThemeData(
    scaffoldBackgroundColor: blackColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        color: whiteColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
