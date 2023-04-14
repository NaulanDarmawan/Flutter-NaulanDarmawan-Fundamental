import 'dart:async';

import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/login'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(),
            const SizedBox(height: 16),
            judul(),
          ],
        ),
      ),
    );
  }

  Widget logo() {
    return SizedBox(
      width: 313,
      height: 311,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget judul() {
    return SizedBox(
      width: 361,
      height: 91,
      child: Image.asset('assets/images/title.png'),
    );
  }
}
