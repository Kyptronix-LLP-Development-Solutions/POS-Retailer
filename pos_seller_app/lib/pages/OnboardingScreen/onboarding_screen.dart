import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/themes/app_colors.dart';
import 'page_view_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      "image": "assets/step1.png",
      "title": "Set Up Your Shop",
      "description":
          "Create your store and start selling in just a few minutes.",
      "icon": Icons.store_outlined,
    },
    {
      "image": "assets/step2.png",
      "title": "Add Your Products",
      "description":
          "Easily upload, organize, and showcase your products to attract customers.",
      "icon": Icons.inventory_2_outlined,
    },
    {
      "image": "assets/step3.png",
      "title": "Boost Your Sales",
      "description":
          "Promote your listings and get in front of more buyers with tailored marketing tools.",
      "icon": Icons.trending_up_outlined,
    },
    {
      "image": "assets/step4.png",
      "title": "Monitor Your Progress",
      "description":
          "Get detailed insights into your sales, customer activity, and growth trends.",
      "icon": Icons.analytics_outlined,
    },
    {
      "image": "assets/step5.png",
      "title": "Hassle-Free Transactions",
      "description":
          "Offer secure payment options and reliable shipping for a seamless customer experience.",
      "icon": Icons.payments_outlined,
    },
    {
      "image": "assets/step6.png",
      "title": "Connect & Engage",
      "description":
          "Communicate directly with customers and build lasting relationships.",
      "icon": Icons.people_outline,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              child: Column(
                children: [
                  // Skip button at top
                  Align(
                    alignment: Alignment.topRight,
                    child: _currentPage != _onboardingData.length - 1
                        ? TextButton(
                            onPressed: () {
                              _pageController.animateToPage(
                                _onboardingData.length - 1,
                                duration: Duration(milliseconds: 600),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                color: LightThemeColors.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ),

                  // PageView for onboarding screens
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: _onboardingData.length,
                      itemBuilder: (context, index) {
                        return PageViewContent(
                          icon: _onboardingData[index]['icon'],
                          title: _onboardingData[index]['title']!,
                          description: _onboardingData[index]['description']!,
                        );
                      },
                    ),
                  ),

                  // Page Indicators
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardingData.length,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? LightThemeColors.accent
                                : LightThemeColors.onPrimary
                                    .withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Bottom buttons
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: _currentPage == _onboardingData.length - 1
                        ? Container(
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
                                /* Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                ); */
                                context.go('/loginScreen');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  color: LightThemeColors.onPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Next Button
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
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
                                child: IconButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: LightThemeColors.onPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
