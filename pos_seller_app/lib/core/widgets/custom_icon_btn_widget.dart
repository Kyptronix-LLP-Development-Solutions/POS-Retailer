import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/get_theme_mode.dart';

class CustomIconBtnWidget extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const CustomIconBtnWidget(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool isDark = isDarkMode(context);
    return IconButton(
      icon: Icon(
        icon,
        color: isDark ? DarkThemeColors.onPrimary : LightThemeColors.onPrimary,
      ),
      onPressed: onPressed,
    );
  }
}
