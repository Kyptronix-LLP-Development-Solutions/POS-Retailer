import 'package:flutter/material.dart';

import '../../core/themes/app_colors.dart';

class PageViewContent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const PageViewContent({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: LightThemeColors.onPrimary.withValues(alpha: 0.1),
              border: Border.all(
                color: LightThemeColors.onPrimary.withValues(alpha: 0.2),
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              size: 60,
              color: LightThemeColors.onPrimary,
            ),
          ),
          SizedBox(height: 40),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: LightThemeColors.onPrimary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),

          SizedBox(height: 16),

          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: LightThemeColors.onPrimary.withValues(alpha: 0.8),
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
