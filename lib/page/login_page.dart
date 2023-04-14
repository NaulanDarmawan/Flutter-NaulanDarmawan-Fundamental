import 'package:flutter/material.dart';
import 'package:flutter_naulandarmawan_fundamental/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  bool sembunyikan = true;
  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar(),
        body: ListView(
          children: [
            const SizedBox(height: 26),
            judul(),
            const SizedBox(height: 27),
            formLogin(),
            const SizedBox(height: 27),
            rowButton(),
          ],
        ),
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(387),
        child: SizedBox(
            width: double.infinity,
            child: Image.asset('assets/images/login.png')));
  }

  Widget judul() {
    return Container(
        margin: const EdgeInsets.only(left: 29),
        child: Text('Welcome\nEarth Savior!', style: judulTextStyle));
  }

  Widget formLogin() {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

  Widget rowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: headerColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Text('Log In', style: subJudulTextStyle)),
        const SizedBox(width: 27),
        ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: headerColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Text('Register', style: subJudulTextStyle)),
      ],
    );
  }
}
