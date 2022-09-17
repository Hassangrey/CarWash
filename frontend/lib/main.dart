// @dart=2.
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:safacw/models/language_constants.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/screens/Screens%201/laundry_main_screen.dart';
import 'package:safacw/screens/Screens%202/building_cleaning_main_screen.dart';
import 'package:safacw/screens/Screens%203/cart_screen.dart';
import 'package:safacw/screens/bottom_navigation_bar_holder.dart';
import 'package:safacw/screens/carwash_main_screen.dart';
import 'package:safacw/screens/item_details_screen.dart';
import 'package:safacw/screens/Screens%204/settings_screen.dart';
import 'package:safacw/screens/signup_page.dart';
import 'package:safacw/widgets/SliderMenu.dart';
import 'package:safacw/screens/login_screen.dart';
import 'package:safacw/screens/choose_provider_screen.dart';
import 'models/Cart.dart';
import 'models/Item.dart';
import 'screens/choose_service_screen.dart';
import 'screens/Screens 4/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: const Safa(),
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
    return ScreenUtilInit(
      designSize: const Size(412, 869),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CarWashProvider()),
          ],
          child: MaterialApp(
              theme: ThemeData(
                fontFamily: 'JosefinSans',
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: SignUpPage.id,
              onGenerateRoute: onGenerateRoute,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _locale),
        );
      },
    );
  }
}

Route? onGenerateRoute(RouteSettings routeSettings) {
  if (routeSettings.name == WelcomePage.id) {
    return MaterialPageRoute(builder: (context) => WelcomePage());
  } else if (routeSettings.name == SlideMenu.id) {
    return MaterialPageRoute(builder: (_) => SlideMenu());
  } else if (routeSettings.name == NavBarHolder.id) {
    return MaterialPageRoute(builder: (_) => const NavBarHolder());
  } else if (routeSettings.name == SettingsScreen.id) {
    return MaterialPageRoute(builder: (_) => SettingsScreen());
  } else if (routeSettings.name == CartScreen.id) {
    return MaterialPageRoute(builder: (_) => CartScreen());
  } else if (routeSettings.name == SignUpPage.id) {
    return MaterialPageRoute(builder: (_) => const SignUpPage());
  } else if (routeSettings.name == LoginScreen.id) {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  } else if (routeSettings.name == ChooseProvider.id) {
    return MaterialPageRoute(builder: (_) => const ChooseProvider());
  } else if (routeSettings.name == CarWashMain.id) {
    return MaterialPageRoute(builder: (_) => CarWashMain());
  } else if (routeSettings.name == LaundryMainScreen.id) {
    return MaterialPageRoute(builder: (_) => LaundryMainScreen());
  } else if (routeSettings.name == BuildingCleaningMainScreen.id) {
    return MaterialPageRoute(builder: (_) => BuildingCleaningMainScreen());
  } else if (routeSettings.name == ItemDetailsPage.id) {
    final value = routeSettings.arguments as Item; // Retrieve the value.
    return MaterialPageRoute(builder: (context) => ItemDetailsPage(value));
  } else {
    return null;
  }
}
