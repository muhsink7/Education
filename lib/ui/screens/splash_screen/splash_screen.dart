import 'package:education/constants/color_constants.dart';
import 'package:education/ui/screens/login_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:education/ui/widgets/animated_splash_screen.dart';
import 'package:education/constants/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(Images.splash),
      nextScreen: const LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      backgroundColor: primaryColor,
      animationDuration: const Duration(milliseconds: 1600),
      duration: 2500,
    );
  }
}
