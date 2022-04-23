// @dart=2.
import 'package:flutter/material.dart';
import 'package:safacw/Cart%20Page/cart_page.dart';
import 'package:safacw/Cart%20Page/myorders_page.dart';
import 'package:safacw/Details%20Page/ItemDetailsPage.dart';
import 'package:safacw/SettingsPage.dart';
import 'package:safacw/SliderMenu.dart';
import 'package:safacw/Welcome%20Page/login_screen.dart';
import 'package:safacw/screens/choose_provider_page.dart';
import 'Models/Item.dart';
import 'Welcome Page/signup_page.dart';
import 'Welcome Page/WelcomePage.dart';
import 'SettingsPage.dart';
import 'package:safacw/morePage.dart';

import 'Welcome Page/login_page.dart';

void main() => runApp(Safa());

class Safa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomePage.id,
      onGenerateRoute: onGenerateRoute,
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
  } else if (routeSettings.name == SignUpPage.id) {
    return MaterialPageRoute(builder: (_) => SignUpPage());
  } else if (routeSettings.name == LoginScreen.id) {
    return MaterialPageRoute(builder: (_) => LoginScreen());
  } else if (routeSettings.name == ChooseProvider.id) {
    return MaterialPageRoute(builder: (_) => ChooseProvider());
  } else if (routeSettings.name == MyOrdersPage.id) {
    return MaterialPageRoute(builder: (_) => MyOrdersPage());
  } else if (routeSettings.name == CartPage.id) {
    return MaterialPageRoute(builder: (_) => CartPage());
  } else if (routeSettings.name == ItemDetailsPage.id) {
    final value = routeSettings.arguments as Item; // Retrieve the value.
    return MaterialPageRoute(builder: (context) => ItemDetailsPage(value));
  } else {
    return null;
  }
}
