import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  var formKey = GlobalKey<FormState>();
  bool sembunyikan = true;
  late AnimationController _controller;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController usernameController;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _controller.repeat();
    emailController = TextEditingController();
    passController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    emailController.dispose();
    passController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 45),
            logoAnimasi(),
            const SizedBox(height: 25),
            judul(),
            const SizedBox(height: 32),
            formRegister(),
            const SizedBox(height: 32),
            button(),
          ],
        ),
      ),
    );
  }

  Widget logoAnimasi() {
    return Lottie.asset('assets/animation/register.json',
        controller: _controller);
  }

  Widget judul() {
    return Text('Welcome!', style: judulTextStyle);
  }

  Widget formRegister() {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 47),
              child: Text('Username', style: subJudulTextStyle),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 29),
              width: 332,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: inputColor),
              child: TextFormField(
                controller: usernameController,
                textAlignVertical: TextAlignVertical.top,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon Masukkan Data!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Container(
              margin: const EdgeInsets.only(left: 47),
              child: Text('Email', style: subJudulTextStyle),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 29),
              width: 332,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: inputColor),
              child: TextFormField(
                controller: emailController,
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon Masukkan Data!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Container(
              margin: const EdgeInsets.only(left: 47),
              child: Text('Password', style: subJudulTextStyle),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 29),
              width: 332,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: inputColor),
              child: TextFormField(
                controller: passController,
                textAlignVertical: TextAlignVertical.top,
                obscureText: sembunyikan,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon Masukkan Data!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          sembunyikan = !sembunyikan;
                        });
                      },
                      icon: sembunyikan
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget button() {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: headerColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text('Register', style: subJudulTextStyle));
  }
}
