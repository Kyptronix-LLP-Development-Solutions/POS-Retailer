import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../Dashboard/presentation/home.dart';
import '../../signUpScreen/presentation/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Stack(
            children: [
              // Background Gradient
              Container(
                decoration: BoxDecoration(
                  gradient: GradientColors.coolBlueGradient,
                ),
              ),

              // Subtle Pattern Overlay
              Opacity(
                opacity: 0.05,
                child: Container(
                  decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.hardLight,
                    // gradient: GradientColors.softGradient,
                    color: Colors.red,
                  ),
                ),
              ),

              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        // App Logo or Brand
                        SizedBox(height: 60),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: GradientColors.softGradient,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.lock_outline,
                            size: 50,
                            color: LightThemeColors.primary,
                          ),
                        ),

                        SizedBox(height: 30),
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            color: LightThemeColors.onPrimary,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),

                        Text(
                          'Sign in to continue',
                          style: TextStyle(
                            color: LightThemeColors.onPrimary
                                .withValues(alpha: 0.8),
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 40),

                        // Username TextField with enhanced styling
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: 'Email or Username',
                              hintStyle: TextStyle(
                                color: LightThemeColors.onPrimary
                                    .withValues(alpha: 0.6),
                              ),
                              filled: true,
                              fillColor: Colors.white.withValues(alpha: 0.15),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: LightThemeColors.onPrimary
                                    .withValues(alpha: 0.8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16),
                            ),
                            style: TextStyle(color: LightThemeColors.onPrimary),
                          ),
                        ),

                        SizedBox(height: 16.0),

                        // Password TextField with enhanced styling
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: LightThemeColors.onPrimary
                                      .withValues(alpha: 0.6)),
                              filled: true,
                              fillColor: Colors.white.withValues(alpha: 0.15),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: LightThemeColors.onPrimary
                                    .withValues(alpha: 0.8),
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_off,
                                color: LightThemeColors.onPrimary
                                    .withValues(alpha: 0.8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16),
                            ),
                            style: TextStyle(color: LightThemeColors.onPrimary),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Implement Forgot Password
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: LightThemeColors.onPrimary
                                    .withValues(alpha: 0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24),

                        // Login Button with gradient
                        Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: GradientColors.primaryGradient,
                            boxShadow: [
                              BoxShadow(
                                color: LightThemeColors.primary
                                    .withValues(alpha: 0.3),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SellerDashboardScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: LightThemeColors.onPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24),

                        Text(
                          'OR',
                          style: TextStyle(
                            color: LightThemeColors.onPrimary
                                .withValues(alpha: 0.8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 24),

                        // Google Sign In Button
                        Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Implement Google Sign In
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: LightThemeColors.text,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/1920px-Google_2015_logo.svg.png',
                                height: 24,
                              ),
                            ),
                            iconAlignment: IconAlignment.end,
                            label: Text(
                              'Continue with',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: LightThemeColors.text
                                    .withValues(alpha: 0.8),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 30),

                        // Sign Up Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: LightThemeColors.onPrimary
                                    .withValues(alpha: 0.8),
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to Sign Up
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: LightThemeColors.accent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
