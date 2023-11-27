
import 'package:flutter/material.dart';
import 'package:medshop/firebase_api.dart';
import 'package:medshop/provider/authProvider/profileProvider.dart';
import 'package:medshop/provider/categoryProvider/categoryProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medshop/screens/BottomBar_Screens/notification.dart';
import 'package:medshop/screens/splashScreen.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    await FirebaseApi().initNotification();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProfileSetupProvider()),
          ChangeNotifierProvider<CategoryProvider>(
        create: (_) => CategoryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedShop',
      home: Splash(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification':(context) => NotificationScreen()
      },
      // home: AnimatedBarExample(),
    );
  }
}
