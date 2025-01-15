import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  /* -------------------------------------------------------------------------- */
  /*                            ElevatedButton Styles                           */
  /* -------------------------------------------------------------------------- */

  // elevatedButton Style Light
  static ButtonStyle elevatedButtonStyleLight = ElevatedButton.styleFrom(
    backgroundColor: LightThemeColors.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),
    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    elevation: 4,
  );

  // elevatedButton Style Dark
  static ButtonStyle elevatedButtonStyleDark = ElevatedButton.styleFrom(
    backgroundColor: DarkThemeColors.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    elevation: 4,
  );

  /* -------------------------------------------------------------------------- */
  /*                                  TextStyle                                 */
  /* -------------------------------------------------------------------------- */
  // Button Text
  static TextStyle buttonText = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Ideal for button text
    ),
  );
}
