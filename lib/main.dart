import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/auth/screens/sign_in_screen.dart';
import 'package:quitanda_virtual/src/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GroceryStore',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190)
      ),
      home: SplashScreen(),
    );
  }
}

