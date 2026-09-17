import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.fondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.lima,
          brightness: Brightness.dark,
        ),
      );
}
