import 'package:flutter/material.dart';
import 'package:pos_seller_app/core/widgets/custom_icon_btn_widget.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/get_theme_mode.dart';

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  @override
  State<SellerDashboardScreen> createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  bool toggleDarkMode = false;

  @override
  Widget build(BuildContext context) {
    bool isDark = isDarkMode(context);
    return Scaffold(
      backgroundColor:
          isDark ? DarkThemeColors.background : LightThemeColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: GradientColors.coolBlueGradient),
        ),
        title: Text(
          'Seller Dashboard',
          style: TextStyle(
            color:
                isDark ? DarkThemeColors.onPrimary : LightThemeColors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     isDark ? Icons.light_mode : Icons.dark_mode,
          //     color: isDark
          //         ? DarkThemeColors.onPrimary
          //         : LightThemeColors.onPrimary,
          //   ),
          //   // onPressed: () => setState(() => isDarkMode = !isDarkMode),
          //   onPressed: () {},
          // ),
          CustomIconBtnWidget(
            icon: isDark ? Icons.light_mode : Icons.dark_mode,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: isDark
                  ? DarkThemeColors.onPrimary
                  : LightThemeColors.onPrimary,
            ),
            onPressed: () {
              // Navigate to notifications
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor:
                  isDark ? DarkThemeColors.accent : LightThemeColors.accent,
              child: IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () {
                  // Navigate to profile
                },
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Implement refresh logic
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? DarkThemeColors.text
                            : LightThemeColors.text,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          DashboardCard(
                            title: 'Total Sales',
                            value: '₹1,25,000',
                            icon: Icons.currency_rupee,
                            gradient: GradientColors.primaryGradient,
                            isDarkMode: isDark,
                          ),
                          DashboardCard(
                            title: 'Total Orders',
                            value: '245',
                            icon: Icons.shopping_bag_outlined,
                            gradient: GradientColors.secondaryGradient,
                            isDarkMode: isDark,
                          ),
                          DashboardCard(
                            title: 'Products Sold',
                            value: '1025',
                            icon: Icons.inventory_2_outlined,
                            gradient: GradientColors.accentGradient,
                            isDarkMode: isDark,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? DarkThemeColors.text
                            : LightThemeColors.text,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: [
                        ActionCard(
                          title: 'Add Product',
                          icon: Icons.add_box_outlined,
                          gradient: GradientColors.successGradient,
                          isDarkMode: isDark,
                          onTap: () {},
                        ),
                        ActionCard(
                          title: 'View Orders',
                          icon: Icons.receipt_long_outlined,
                          gradient: GradientColors.warningGradient,
                          isDarkMode: isDark,
                          onTap: () {},
                        ),
                        ActionCard(
                          title: 'Analytics',
                          icon: Icons.analytics_outlined,
                          gradient: GradientColors.secondaryGradient,
                          isDarkMode: isDark,
                          onTap: () {},
                        ),
                        ActionCard(
                          title: 'Settings',
                          icon: Icons.settings_outlined,
                          gradient: GradientColors.accentGradient,
                          isDarkMode: isDark,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? DarkThemeColors.text
                            : LightThemeColors.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ActivityCard(
                    title: 'Order #${12345 - index}',
                    subtitle:
                        'Ordered ${2 + index} items, Total ₹${1200 + index * 100}',
                    time: '${index * 2} hours ago',
                    status: _getStatus(index),
                    isDarkMode: isDark,
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: GradientColors.primaryGradient,
          ),
          child: const Icon(Icons.add, size: 32),
        ),
      ),
    );
  }

  String _getStatus(int index) {
    switch (index % 3) {
      case 0:
        return 'Delivered';
      case 1:
        return 'Pending';
      case 2:
        return 'Processing';
      default:
        return 'Unknown';
    }
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Gradient gradient;
  final bool isDarkMode;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.gradient,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Gradient gradient;
  final bool isDarkMode;

  const ActionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.gradient,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 32),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    final colors = isDarkMode ? DarkThemeColors : LightThemeColors;

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
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? DarkThemeColors.text : LightThemeColors.text,
          ),
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
                Text(
                  time,
                  style: TextStyle(
                    color: isDarkMode
                        ? DarkThemeColors.text.withValues(alpha: 0.5)
                        : LightThemeColors.text.withValues(alpha: 0.5),
                  ),
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
          child: Text(
            status,
            style: TextStyle(
              color: _getStatusColor(status),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
