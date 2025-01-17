import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_seller_app/core/themes/app_theme.dart';
import 'package:pos_seller_app/core/themes/theme_cubit.dart';

import 'config/routes/router.dart';
import 'pages/BottomNavigation/bloc/bottom_nav_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          ThemeData theme;
          switch (themeState) {
            case ThemeState.darkMode:
              theme = AppTheme.darkTheme;
              break;
            case ThemeState.lightMode:
              theme = AppTheme.lightTheme;
              break;
          }
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'POS Sellers App',
            theme: theme,
            // home: const OnboardingScreen(),
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}

/* --------------------------- ******************* -------------------------- */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'data',
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ),
            Text(
              'data',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
