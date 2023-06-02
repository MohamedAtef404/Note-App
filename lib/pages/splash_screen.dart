import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'images/splash_screen.png',
      nextScreen: const HomePage(),
      animationDuration: Duration(seconds: 1),
      splashIconSize: 200,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
