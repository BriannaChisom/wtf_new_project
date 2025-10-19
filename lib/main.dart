import 'package:flutter/material.dart';
import 'package:wtf_new_project/bottom_navigation.dart';
import 'package:wtf_new_project/home_page.dart';
import 'package:wtf_new_project/login_page.dart';
import 'package:wtf_new_project/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context)=> OnboardingPage(),
        "/home": (context)=> BottomNavigation(),
        "/login": (context) => LoginPage()
      },
    );
  }
}

