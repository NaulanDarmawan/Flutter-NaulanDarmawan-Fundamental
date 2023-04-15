import 'package:flutter/material.dart';
import 'package:flutter_naulandarmawan_fundamental/firebase_options.dart';
import 'package:flutter_naulandarmawan_fundamental/hidden_drawer.dart';
import 'package:flutter_naulandarmawan_fundamental/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'page/landing_page.dart';
import 'page/login_page.dart';
import 'page/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/home': (context) => const HiddenDrawer(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
      ),
    );
  }
}
