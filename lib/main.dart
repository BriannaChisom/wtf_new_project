import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wtf_new_project/bottom_navigation.dart';
import 'package:wtf_new_project/home_page.dart';
import 'package:wtf_new_project/login_page.dart';
import 'package:wtf_new_project/onboarding_page.dart';
import 'package:wtf_new_project/provider/user_notifier.dart';
import 'package:wtf_new_project/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserNotifier(),
      child: MaterialApp(
        title: 'MediCall',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.robotoTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "/o": (context)=> OnboardingPage(),
          "/home": (context)=> BottomNavigation(),
          "/login": (context) => LoginPage(),
          "/signup": (context) => SignupPage(),
        
        },
        initialRoute: "/login",
      ),
    );
  }
}

