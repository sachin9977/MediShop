import 'package:flutter/material.dart';
import 'package:medshop/BottomBar.dart';
import 'package:medshop/provider/authProvider/profileProvider.dart';
import 'package:medshop/provider/categoryProvider/categoryProvider.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedShop',
      // home: Splash(),
      home: AnimatedBarExample(),
    );
  }
}
