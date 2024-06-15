import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/app_colors.dart';

class ThemeApplications {
  static bool isDark = true;
  static ThemeData themeLight = ThemeData(
    scaffoldBackgroundColor: blackColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: blackColor,
        iconTheme: IconThemeData(color: whiteColor, size: 30)),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 32.sp,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
        color: whiteColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 24.sp,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 20.sp,
        color: whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: whiteColor,
      ),
    ),
  );
}
