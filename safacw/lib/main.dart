// @dart=2.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safacw/screens/cart_page.dart';
import 'package:safacw/screens/confirmed_order_page.dart';
import 'package:safacw/screens/myorders_page.dart';
import 'package:safacw/screens/item_details_page.dart';
import 'package:safacw/screens/settings_page.dart';
import 'package:safacw/screens/signup_page.dart';
import 'package:safacw/widgets/SliderMenu.dart';
import 'package:safacw/screens/login_screen.dart';
import 'package:safacw/screens/choose_provider_page.dart';
import 'Models/Cart.dart';
import 'Models/Item.dart';
import 'screens/welcome_page.dart';
import 'screens/settings_page.dart';
import 'package:safacw/screens/more_items_page.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: Safa(),
      ),
    );

class Safa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 629),
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.id,
          onGenerateRoute: onGenerateRoute,
        );
      },
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
    return MaterialPageRoute(builder: (_) => const SignUpPage());
  } else if (routeSettings.name == LoginScreen.id) {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  } else if (routeSettings.name == ChooseProvider.id) {
    return MaterialPageRoute(builder: (_) => const ChooseProvider());
  } else if (routeSettings.name == MyOrdersPage.id) {
    return MaterialPageRoute(builder: (_) => const MyOrdersPage());
  } else if (routeSettings.name == CartPage.id) {
    return MaterialPageRoute(builder: (_) => const CartPage());
  } else if (routeSettings.name == ConfirmOrder.id) {
    return MaterialPageRoute(builder: (_) => const ConfirmOrder());
  } else if (routeSettings.name == ItemDetailsPage.id) {
    final value = routeSettings.arguments as Item; // Retrieve the value.
    return MaterialPageRoute(builder: (context) => ItemDetailsPage(value));
  } else {
    return null;
  }
}
