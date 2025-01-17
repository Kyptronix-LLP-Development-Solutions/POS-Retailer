import 'package:go_router/go_router.dart';

import '../../pages/Authentication/LoginScreen/presentation/login_screen.dart';
import '../../pages/Authentication/signUpScreen/presentation/signup_screen.dart';
import '../../pages/BottomNavigation/presentation/bottom_nav_bar.dart';
import '../../pages/Dashboard/presentation/home.dart';
import '../../pages/OnboardingScreen/onboarding_screen.dart';

class AppRouter {
  static GoRouter get router {
    return GoRouter(
      // observers: [BackButtonInterceptor()],
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => OnboardingScreen(),
        ),
        GoRoute(
          path: '/loginScreen',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/signupScreen',
          builder: (context, state) => SignupScreen(),
        ),
        GoRoute(
          path: '/bottomNavScreen',
          builder: (context, state) => BottomNavScreen(),
        ),
        GoRoute(
          path: '/sellersDashboard',
          builder: (context, state) => SellerDashboardScreen(),
        ),
        /* GoRoute(
          path: '/details/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return DetailsScreen(id: id);
          },
        ), */
      ],
    );
  }
}
