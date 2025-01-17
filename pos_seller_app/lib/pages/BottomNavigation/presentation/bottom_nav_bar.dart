import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_seller_app/core/widgets/custom_text_widgets.dart';

import '../../Dashboard/presentation/home.dart';
import '../../settings/presentation/settings_screen.dart';
import '../bloc/bottom_nav_bloc.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isDark = isDarkMode(context);
    return Scaffold(
      body: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is BottomNavUpdatedState) {
            currentIndex = state.selectedIndex;
          }
          return _getTabBody(currentIndex);
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is BottomNavUpdatedState) {
            currentIndex = state.selectedIndex;
          }

          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomAppBar(
                height: 65,
                padding: EdgeInsets.zero,
                notchMargin: 8,
                shape: const CircularNotchedRectangle(),

                /* --------------------------------- colors --------------------------------- */

                // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(context, 0, Icons.home_outlined, Icons.home,
                        'Home', currentIndex),
                    _buildNavItem(context, 1, Icons.shopping_cart_outlined,
                        Icons.shopping_cart, 'Orders', currentIndex),
                    _buildNavItem(context, 2, Icons.person_outline,
                        Icons.person, 'Profile', currentIndex),
                    _buildNavItem(context, 3, Icons.settings_outlined,
                        Icons.settings, 'Settings', currentIndex),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData outlinedIcon,
      IconData filledIcon, String label, int currentIndex) {
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () => BlocProvider.of<BottomNavBloc>(context)
          .add(BottomNavTabChanged(index)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: isSelected ? Colors.blueAccent : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 4.0),
            CustomBodyText(
              text: label,
              color: isSelected ? Colors.blueAccent : Colors.grey,
              fontSize: 12.0,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            )
          ],
        ),
      ),
    );
  }

  Widget _getTabBody(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return SellerDashboardScreen();
      case 1:
        return const OrdersScreen();
      case 2:
        return const ProfileScreen();
      case 3:
        return const SettingsScreen();
      default:
        return const SellerDashboardScreen();
    }
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Orders Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
    );
  }
}
