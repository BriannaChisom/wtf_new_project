import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wtf_new_project/bottom_navigation.dart';
import 'package:wtf_new_project/login_page.dart';
import 'package:wtf_new_project/onboarding_page.dart';
import 'package:wtf_new_project/provider/user_cubit.dart';
import 'package:wtf_new_project/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
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

