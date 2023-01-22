import 'package:flutter/material.dart';
import 'package:Deneme/giris/Anaekran.dart';
import 'package:Deneme/giris/screens/onboarding_screen.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        "/": (context) => OnboardingScreen(),
        "/home": (context) => const Anaekran()
      },
    );
  }
}