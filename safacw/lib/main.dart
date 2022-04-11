import 'package:flutter/material.dart';
import 'package:safacw/Details%20Page/ItemDetailsPage.dart';
import 'package:safacw/SettingsPage.dart';
import 'package:safacw/SliderMenu.dart';
import 'package:safacw/carWashMain.dart';
import 'WelcomePage.dart';
import 'SettingsPage.dart';
import 'package:safacw/morePage.dart';
void main() => runApp(Safa());

class Safa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        SlideMenu.id: (context) => SlideMenu(),
        SettingsPage.id: (context) => SettingsPage(),
        morePage.id: (context) => morePage(),
        carWashMain.id: (context) => carWashMain(),
        ItemDetailsPage.id: (context) => ItemDetailsPage(),










      },
    );
  }
}
