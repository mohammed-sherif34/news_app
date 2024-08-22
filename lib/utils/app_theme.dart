import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        color: AppColors.lightGray,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: AppColors.darkGray,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        color: AppColors.lightGray,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
