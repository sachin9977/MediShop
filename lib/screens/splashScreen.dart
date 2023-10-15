import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:medshop/screens/onboarding_screens/onboarding.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/logoone.png'),
      logoWidth: 160,
      backgroundColor: const Color.fromARGB(255, 69, 161, 218),
      showLoader: true,
      loaderColor: Colors.white,
      navigator: const onboard(),
      durationInSeconds: 3,
    );
  }
}
