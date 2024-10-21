import 'package:flutter/material.dart';
import 'package:superapp/cores/ui/app_colors.dart';

abstract class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: 'Inter',
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
      ),
    ),
  );
}
