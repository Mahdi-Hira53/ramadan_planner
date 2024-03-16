import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/utils.dart';
import '../auth_screen/register.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      duration: 60,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 300,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage("assets/images/logo.png"),
            height: size.height * 0.3,
            width: size.width * 0.6,
          ),
        ],
      ),
      nextScreen: const Registration(),
    );
  }
}
