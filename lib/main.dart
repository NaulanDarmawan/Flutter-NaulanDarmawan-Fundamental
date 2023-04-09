import 'package:flutter/material.dart';
import 'package:flutter_naulandarmawan_fundamental/theme.dart';

import 'page/home_page.dart';
import 'page/landing_page.dart';
import 'page/login_page.dart';
import 'page/register_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        buttonTheme: ButtonThemeData(buttonColor: headerColor),
      ),
    );
  }
}
