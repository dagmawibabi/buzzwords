import 'package:buzzwords/pages/auth/login_page.dart';
import 'package:buzzwords/pages/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:buzzwords/pages/parent_page/parent_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buzzwords',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        // "/": (context) => ParentPage(),
        // "/": (context) => OnboardingPage(),
        "/": (context) => LoginPage(),
      },
      theme: ThemeData(
        // scaffoldBackgroundColor: Color(0xff0f0f0f),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          // backgroundColor: Color(0xff0f0f0f),
          // titleTextStyle: TextStyle(
          //   color: Colors.amber[900],
          // ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
