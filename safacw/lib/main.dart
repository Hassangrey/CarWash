import 'package:flutter/material.dart';
import 'package:safacw/Details%20Page/ItemDetailsPage.dart';
import 'package:safacw/SettingsPage.dart';
import 'package:safacw/SliderMenu.dart';
import 'package:safacw/carWashMain.dart';
import 'Models/Items.dart';
import 'WelcomePage.dart';
import 'SettingsPage.dart';
import 'package:safacw/morePage.dart';

void main() => runApp(Safa());

class Safa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomePage.id,
      onGenerateRoute: onGenerateRoute,

      /* routes: {
        WelcomePage.id: (context) => WelcomePage(),
        SlideMenu.id: (context) => SlideMenu(),
        SettingsPage.id: (context) => SettingsPage(),
        morePage.id: (context) => morePage(),
        carWashMain.id: (context) => carWashMain(),
        ItemDetailsPage.id: (context) => ItemDetailsPage(),










      },*/
    );
  }
}

Route? onGenerateRoute(RouteSettings routeSettings) {
  //if (routeSettings.name == '/welcomePage') {
  //final value = routeSettings.arguments as String; // Retrieve the value.
  //return MaterialPageRoute(builder: (context) => DetailTask(value));
  //}
  if (routeSettings.name == WelcomePage.id) {
    return MaterialPageRoute(builder: (context) => WelcomePage());
  } else if (routeSettings.name == SlideMenu.id) {
    return MaterialPageRoute(builder: (_) => SlideMenu());
  } else if (routeSettings.name == SettingsPage.id) {
    return MaterialPageRoute(builder: (_) => SettingsPage());
  } else if (routeSettings.name == morePage.id) {
    return MaterialPageRoute(builder: (_) => morePage());
  } else if (routeSettings.name == carWashMain.id) {
    return MaterialPageRoute(builder: (_) => carWashMain());
  } else if (routeSettings.name == ItemDetailsPage.id) {
    final value = routeSettings.arguments as Items; // Retrieve the value.
    return MaterialPageRoute(builder: (context) => ItemDetailsPage(value));
  } else {
    return null;
  }
}
