// import 'package:easy_splash_screen/easy_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:medshop/screens/onboarding_screens/onboarding.dart';

// class Splash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return EasySplashScreen(
//       logo: Image.asset('assets/images/logoone.png'),
//       logoWidth: 160,
//       backgroundColor: const Color.fromARGB(255, 69, 161, 218),
//       showLoader: true,
//       loaderColor: Colors.white,
//       navigator: const onboard(),
//       durationInSeconds: 3,
//     );
//   }
// }


import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medshop/BottomBar.dart';
import 'package:medshop/screens/onboarding_screens/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Check user authentication status before navigating to the app's content
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final user = snapshot.data;

          if (user != null) {
            // User is authenticated, navigate to the main app content
            return const AnimatedBarExample(); // Replace with your main app content.
          } else {
            // User is not authenticated, navigate to the onboarding screens
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
        } else {
          // Handle loading state, you can show a loading indicator here
          return const Center(
              child: SpinKitSpinningLines(
            color: Colors.blue,
            size: 50.0,
          ));
        }
      },
    );
  }
}
