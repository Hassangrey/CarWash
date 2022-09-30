// @dart=2.
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Models/language_constants.dart';
import 'package:safacw/screens/bottom_navigation_bar_holder.dart';
import 'package:safacw/screens/3rd_screen.dart';
import 'package:safacw/screens/order_history_screen.dart';
import 'package:safacw/screens/settings_page.dart';
import 'Models/Cart.dart';
import 'Models/Item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:safacw/screens/orderDetails.dart';
import 'package:safacw/screens/acceptedOrder.dart';

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
      designSize: const Size(412, 869),
      builder: (context, child) {
        return MaterialApp(
            theme: ThemeData(
              fontFamily: 'JosefinSans',
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: NavBarHolder.id,
            onGenerateRoute: onGenerateRoute,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: _locale);
      },
    );
  }
}

Route? onGenerateRoute(RouteSettings routeSettings) {
  if (routeSettings.name == NavBarHolder.id) {
    return MaterialPageRoute(builder: (_) => NavBarHolder());
  } else if (routeSettings.name == ThirdScreen.id) {
    return MaterialPageRoute(builder: (_) => ThirdScreen());
  } else if (routeSettings.name == SettingsPage.id) {
    return MaterialPageRoute(builder: (_) => SettingsPage());
  } else if (routeSettings.name == SettingsPage.id) {
    return MaterialPageRoute(builder: (_) => SettingsPage());
  } else if (routeSettings.name == orderDetails.id) {
    return MaterialPageRoute(builder: (_) => orderDetails());
  } else if (routeSettings.name == acceptedOrder.id) {
    return MaterialPageRoute(builder: (_) => acceptedOrder());
  } else {
    return null;
  }
}
