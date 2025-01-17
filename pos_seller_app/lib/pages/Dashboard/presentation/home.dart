import 'package:flutter/material.dart';
import 'package:pos_seller_app/core/widgets/custom_icon_btn_widget.dart';
import 'package:pos_seller_app/core/widgets/custom_text_widgets.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/get_theme_mode.dart';
import '../widgets/action_card.dart';
import '../widgets/activity_card.dart';
import '../widgets/dashboard_card.dart';

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
          CustomIconBtnWidget(
            icon: Icons.notifications_outlined,
            onPressed: () {},
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
                    CustomBodyText(
                      text: 'Overview',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color:
                          isDark ? DarkThemeColors.text : LightThemeColors.text,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 150.0,
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
                    const SizedBox(height: 24.0),
                    CustomBodyText(
                      text: 'Quick Actions',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color:
                          isDark ? DarkThemeColors.text : LightThemeColors.text,
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        children: [
                          ActionCard(
                            title: 'Product',
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
                            title: 'Inventory',
                            icon: Icons.inventory_outlined,
                            gradient: GradientColors.accentGradient,
                            isDarkMode: isDark,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomBodyText(
                      text: 'Recent Activity',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color:
                          isDark ? DarkThemeColors.text : LightThemeColors.text,
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
      floatingActionButton: GestureDetector(
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
