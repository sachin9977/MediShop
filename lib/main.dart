import 'package:flutter/material.dart';
import 'package:medshop/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedShop',
      // theme: ThemeData(
      //   primarySwatch: Colors.teal,
      // ),
      home: Splash(),
    );
  }
}
