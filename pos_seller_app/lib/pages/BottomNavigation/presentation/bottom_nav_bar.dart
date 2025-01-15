import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Dashboard/presentation/home.dart';
import '../bloc/bottom_nav_bloc.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Seller Dashboard'),
      //   backgroundColor: Colors.blueAccent,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications),
      //       onPressed: () {
      //         // Handle notifications
      //       },
      //     ),
      //   ],
      // ),
      body: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is BottomNavUpdatedState) {
            currentIndex = state.selectedIndex;
          }

          // Return the appropriate screen based on the selected tab
          return _getTabBody(currentIndex);
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is BottomNavUpdatedState) {
            currentIndex = state.selectedIndex;
          }

          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              BlocProvider.of<BottomNavBloc>(context)
                  .add(BottomNavTabChanged(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }

  // This method decides which screen to show based on the selected index
  Widget _getTabBody(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        // return const HomeScreen();
        return SellerDashboardScreen();
      case 1:
        return const OrdersScreen();
      case 2:
        return const ProfileScreen();
      case 3:
        return const SettingsScreen(); // Show Settings screen for index 3
      default:
        return const HomeScreen();
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen', style: TextStyle(fontSize: 24)),
    );
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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
    );
  }
}
