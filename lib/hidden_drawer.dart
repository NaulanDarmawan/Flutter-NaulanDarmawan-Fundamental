import 'package:flutter/material.dart';
import 'package:flutter_naulandarmawan_fundamental/page/about_page.dart';
import 'package:flutter_naulandarmawan_fundamental/page/account_page.dart';
import 'package:flutter_naulandarmawan_fundamental/page/calculator_page.dart';
import 'package:flutter_naulandarmawan_fundamental/page/home_page.dart';
import 'package:flutter_naulandarmawan_fundamental/page/science_page.dart';
import 'package:flutter_naulandarmawan_fundamental/theme.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Berita Terkini',
              baseStyle: isiTextStyle,
              colorLineSelected: headerColor,
              selectedStyle: subJudulTextStyle),
          const HomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Berita Sains Terbaru',
              baseStyle: isiTextStyle,
              colorLineSelected: headerColor,
              selectedStyle: subJudulTextStyle),
          const SciencePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'About Us',
              baseStyle: isiTextStyle,
              colorLineSelected: headerColor,
              selectedStyle: subJudulTextStyle),
          const AboutPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Account',
              baseStyle: isiTextStyle,
              colorLineSelected: headerColor,
              selectedStyle: subJudulTextStyle),
          const AccountPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'My Calculator',
              baseStyle: isiTextStyle,
              colorLineSelected: headerColor,
              selectedStyle: subJudulTextStyle),
          const CalculatorPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorAppBar: headerColor,
      backgroundColorMenu: headerColor.withOpacity(0.5),
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 60,
      elevationAppBar: 0,
      isTitleCentered: true,
    );
  }
}
