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
      bottomAppBarTheme: BottomAppBarTheme(
        color: LightThemeColors.background,
      ),
      cardTheme: CardTheme(
        color: Color(0xFFF1F5F9),
      ));

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
    bottomAppBarTheme: BottomAppBarTheme(
      color: DarkThemeColors.background,
    ),
    cardTheme: CardTheme(
      color: Color(0xFF172033),
    ),
  );
}
 /* 
          Color(0xFFFFFFFF) // Pure white for primary cards
Color(0xFFF1F5F9) // Very light blueish gray
Color(0xFFE2E8F0) // Light cool gray
Color(0xFFDCE7F9) // Soft blue tint
Color(0xFFEFF6FF) // Light blue hint
          */