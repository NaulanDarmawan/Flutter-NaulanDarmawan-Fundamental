import 'package:flutter/material.dart';

import '../theme.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool sembunyikan = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 45),
          profilePicture(),
          const SizedBox(height: 7),
          judul(),
          const SizedBox(height: 20),
          dataUser(),
          const SizedBox(height: 38),
        ],
      ),
    );
  }

  Widget profilePicture() {
    return SizedBox(
      width: 244,
      height: 214,
      child: Image.asset('assets/images/akun.png', fit: BoxFit.contain),
    );
  }

  Widget judul() {
    return SizedBox(
      width: 214,
      height: 57,
      child: Image.asset('assets/images/title.png'),
    );
  }

  Widget dataUser() {
    return Column(
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
            readOnly: true,
            textAlignVertical: TextAlignVertical.top,
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
            readOnly: true,
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
            readOnly: true,
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
    );
  }
}
