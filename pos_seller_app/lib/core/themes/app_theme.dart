// app_theme.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: LightThemeColors.primary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: LightThemeColors.background,
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.elevatedButtonStyleLight),
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: DarkThemeColors.primary,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: DarkThemeColors.background,
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.elevatedButtonStyleDark),
    brightness: Brightness.dark,
  );
}
