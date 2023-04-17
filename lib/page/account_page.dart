import 'package:flutter/material.dart';
import 'package:flutter_naulandarmawan_fundamental/model/authentication.dart';

import '../theme.dart';

class AccountPage extends StatefulWidget {
  final username, email, password;
  const AccountPage({super.key, this.username, this.email, this.password});

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
          teks(),
          const SizedBox(height: 49),
          button(),
          const SizedBox(height: 30),
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
              hintText: 'Naulan22',
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
              hintText: 'naulan@gmail.com',
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
              hintText: 'NAULAN22',
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

  Widget teks() {
    return Container(
      color: contentColor,
      width: double.infinity,
      height: 91,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(44, 17, 48, 16),
        child: Text(
            textAlign: TextAlign.center,
            'Ambil bagian. Lakukan guna-ulang dan daur-ulang. Bumi ini berharga!',
            style: isiTextStyle),
      ),
    );
  }

  Widget button() {
    return Padding(
      padding: const EdgeInsets.only(left: 246, right: 30),
      child: ElevatedButton(
          onPressed: () {
            AuthenticationHelper()
                .signOut()
                .then((_) => Navigator.pushReplacementNamed(context, '/login'));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: headerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
              )),
          child: Center(child: Text('Log Out', style: isiTextStyle))),
    );
  }
}
