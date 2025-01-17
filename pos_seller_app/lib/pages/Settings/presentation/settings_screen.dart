import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_seller_app/core/themes/get_theme_mode.dart';
import 'package:pos_seller_app/core/widgets/custom_text_widgets.dart';

import '../../../core/themes/theme_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileCard(),
          const SizedBox(height: 24),
          _buildSettingsSection(
            "App Settings",
            [
              _buildSettingsTile(
                icon: Icons.notifications,
                iconColor: Colors.blue,
                title: "Notifications",
                subtitle: "Manage your notification preferences",
                trailing: Switch.adaptive(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() => _notificationsEnabled = value);
                  },
                ),
              ),
              _buildSettingsTile(
                icon: Icons.brightness_6,
                iconColor: Colors.orange,
                title: "Dark Mode",
                subtitle: "Toggle dark/light theme",
                trailing: const CustomSwitch(),
              ),
              _buildSettingsTile(
                icon: Icons.language,
                iconColor: Colors.green,
                title: "Language",
                subtitle: "English (US)",
                onTap: () {
                  // Handle language selection
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsSection(
            "Support & About",
            [
              _buildSettingsTile(
                icon: Icons.help_outline,
                iconColor: Colors.purple,
                title: "Help Center",
                subtitle: "Get help and support",
                onTap: () {
                  // Navigate to help center
                },
              ),
              _buildSettingsTile(
                icon: Icons.info_outline,
                iconColor: Colors.teal,
                title: "About",
                subtitle: "Version 1.0.0",
                onTap: () {
                  // Show about dialog
                },
              ),
              _buildSettingsTile(
                icon: Icons.privacy_tip_outlined,
                iconColor: Colors.indigo,
                title: "Privacy Policy",
                onTap: () {
                  // Show privacy policy
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildLogoutButton(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                // image: const DecorationImage(
                //   image: NetworkImage('https://via.placeholder.com/60'),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "john.doe@example.com",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: () {
                // Navigate to edit profile
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomBodyText(
            text: title,
            color: Colors.grey[600],
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: tiles,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    Color? iconColor,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? Colors.blue).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: iconColor ?? Colors.blue,
          size: 24,
        ),
      ),
      title: CustomBodyText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitle: subtitle != null
          ? CustomBodyText(
              text: subtitle,
              color: Colors.grey[600],
              fontSize: 14,
            )
          : null,
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey[400],
          ),
      onTap: onTap,
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          // Handle logout
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[400],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.exit_to_app,
            ),
            SizedBox(width: 8),
            Text(
              "Log Out",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    bool isDark = isDarkMode(context);
    return Switch.adaptive(
      value: isDark,
      onChanged: (value) {
        themeCubit.toggleTheme();
      },
    );
  }
}
