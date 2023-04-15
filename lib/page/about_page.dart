import 'package:flutter/material.dart';
import 'package:flutter_naulandarmawan_fundamental/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              logo(),
              const SizedBox(height: 17),
              judul(),
              const SizedBox(height: 25),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return SizedBox(
      width: 252,
      height: 252,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget judul() {
    return SizedBox(
      width: 292,
      height: 73,
      child: Image.asset('assets/images/title.png'),
    );
  }

  Widget footer() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: headerColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(26), topRight: Radius.circular(26))),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
                padding: const EdgeInsets.only(left: 43),
                child: SizedBox(
                  width: 285,
                  height: 81,
                  child: Text(
                      'Your Digital Green Friend\nwho will help you to save\nthe world!',
                      style: subJudulTextStyle.copyWith(color: Colors.white)),
                )),
            const SizedBox(height: 25),
            Padding(
                padding: const EdgeInsets.only(left: 43),
                child: SizedBox(
                  width: 285,
                  height: 81,
                  child: Text(
                      'Was established in 2022 which focuses on\nenviromental maintenance activities\nstarting with small sthings.',
                      style: isiTextStyle.copyWith(color: Colors.white)),
                )),
            const SizedBox(height: 15),
            Padding(
                padding: const EdgeInsets.only(left: 43),
                child: SizedBox(
                  width: 285,
                  height: 32,
                  child: Text('Founder',
                      style: subJudulTextStyle.copyWith(color: Colors.white)),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 43),
              width: 285,
              height: 93,
              decoration: BoxDecoration(
                  color: contentColor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(20, 15, 19, 15),
                      width: 62,
                      height: 62,
                      child: Image.asset('assets/images/placeholder.png')),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text('Shinta Aishnabila', style: isiTextStyle),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                var url = Uri.parse('');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Tidak Bisa Buka $url';
                                }
                              },
                              icon: Image.asset(
                                  'assets/images/Icon_Instagram.png')),
                          IconButton(
                              onPressed: () async {
                                var url = Uri.parse('');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Tidak Bisa Buka $url';
                                }
                              },
                              icon: Image.asset(
                                  'assets/images/Icon_LinkedIn.png')),
                          IconButton(
                              onPressed: () async {
                                var url = Uri.parse('');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Tidak Bisa Buka $url';
                                }
                              },
                              icon: Image.asset(
                                  'assets/images/Icon_Twitter.png')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
