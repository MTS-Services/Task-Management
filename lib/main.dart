import 'package:flutter/material.dart';
import 'package:maktrack/presentation/pages/screen/home/home_screen.dart';
import 'package:maktrack/presentation/pages/screen/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
theme: ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
    ),
  )
),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: OnboardingScreen(),
    );
  }
}

