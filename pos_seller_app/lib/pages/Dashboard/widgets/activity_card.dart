import 'package:flutter/material.dart';
import 'package:pos_seller_app/core/widgets/custom_text_widgets.dart';

import '../../../core/themes/app_colors.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String status;
  final bool isDarkMode;

  const ActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.isDarkMode,
  });

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return LightThemeColors.success;
      case 'Pending':
        return LightThemeColors.warning;
      case 'Processing':
        return LightThemeColors.info;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final colors = isDarkMode ? DarkThemeColors : LightThemeColors;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: CustomBodyText(
          text: title,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? DarkThemeColors.text : LightThemeColors.text,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              subtitle,
              // style: TextStyle(color: colors.text.withValues(alpha: 0.7)),
              style: TextStyle(
                color: isDarkMode
                    ? DarkThemeColors.text.withValues(alpha: 0.7)
                    : LightThemeColors.text.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 16,
                  // color: colors.text.withValues(alpha: 0.5),
                  color: isDarkMode
                      ? DarkThemeColors.text.withValues(alpha: 0.5)
                      : LightThemeColors.text.withValues(alpha: 0.5),
                ),
                const SizedBox(width: 4),
                CustomBodyText(
                  text: time,
                  color: isDarkMode
                      ? DarkThemeColors.text.withValues(alpha: 0.5)
                      : LightThemeColors.text.withValues(alpha: 0.5),
                ),
              ],
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getStatusColor(status).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomBodyText(
            text: status,
            color: _getStatusColor(status),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
