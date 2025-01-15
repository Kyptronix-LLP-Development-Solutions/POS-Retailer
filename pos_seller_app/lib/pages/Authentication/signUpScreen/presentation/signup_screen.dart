import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignupScreen({super.key});

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
                    backgroundBlendMode: BlendMode.overlay,
                    gradient: GradientColors.softGradient,
                  ),
                ),
              ),

              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        // Back Button
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: LightThemeColors.onPrimary,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),

                        // App Logo or Brand
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
                            Icons.person_add_outlined,
                            size: 50,
                            color: LightThemeColors.primary,
                          ),
                        ),

                        SizedBox(height: 24),
                        Text(
                          'Create Account',
                          style: TextStyle(
                            color: LightThemeColors.onPrimary,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),

                        Text(
                          'Sign up to get started',
                          style: TextStyle(
                            color: LightThemeColors.onPrimary
                                .withValues(alpha: 0.8),
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 32),

                        // Full Name TextField
                        _buildTextField(
                          controller: nameController,
                          hintText: 'Full Name',
                          icon: Icons.person_outline,
                        ),

                        SizedBox(height: 16),

                        // Email TextField
                        _buildTextField(
                          controller: emailController,
                          hintText: 'Email Address',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(height: 16),

                        // Password TextField
                        _buildTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          icon: Icons.lock_outline,
                          isPassword: true,
                        ),

                        SizedBox(height: 16),

                        // Confirm Password TextField
                        _buildTextField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm Password',
                          icon: Icons.lock_outline,
                          isPassword: true,
                        ),

                        SizedBox(height: 24),

                        // Sign Up Button
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
                              // Implement signup logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
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

                        // Google Sign Up Button
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
                              // Implement Google Sign Up
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
                              'Sign up with',
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

                        // Login Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: LightThemeColors.onPrimary
                                    .withValues(alpha: 0.8),
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Sign In',
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

  // Helper method to build consistent text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
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
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: LightThemeColors.onPrimary.withValues(alpha: 0.6)),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.15),
          prefixIcon: Icon(icon,
              color: LightThemeColors.onPrimary.withValues(alpha: 0.8)),
          suffixIcon: isPassword
              ? Icon(Icons.visibility_off,
                  color: LightThemeColors.onPrimary.withValues(alpha: 0.8))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        style: TextStyle(color: LightThemeColors.onPrimary),
      ),
    );
  }
}
