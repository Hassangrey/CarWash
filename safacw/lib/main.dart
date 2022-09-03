// @dart=2.
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Models/language_constants.dart';
import 'package:safacw/screens/cart_page.dart';
import 'package:safacw/screens/carwash_mainpage.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: Safa(),
      ),
    );

class Safa extends StatefulWidget {
  const Safa({Key? key}) : super(key: key);

  @override
  State<Safa> createState() => _SafaState();

  // ? Function to change the language of the app
  static void setLocale(BuildContext context, Locale newLocale) {
    _SafaState? state = context.findAncestorStateOfType<_SafaState>();
    state?.setLocale(newLocale);
  }
}

class _SafaState extends State<Safa> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    Locale? hello;
    hello = _locale;
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: CarWashMain.id,
            onGenerateRoute: onGenerateRoute,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale('en'));
      },
    );
  }
}

Route? onGenerateRoute(RouteSettings routeSettings) {
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
  } else if (routeSettings.name == CarWashMain.id) {
    return MaterialPageRoute(builder: (_) => CarWashMain());
  } else if (routeSettings.name == ItemDetailsPage.id) {
    final value = routeSettings.arguments as Item; // Retrieve the value.
    return MaterialPageRoute(builder: (context) => ItemDetailsPage(value));
  } else {
    return null;
  }
}
