import 'package:flutter/material.dart';
import 'package:medshop/provider/authProvider/authProvider.dart';
import 'package:medshop/provider/authProvider/profileProvider.dart';
import 'package:medshop/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProfileSetupProvider()),
        //   ChangeNotifierProvider<RoomPostProvider>(
        // create: (_) => RoomPostProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedShop',
      home: Splash(),
    );
  }
}
