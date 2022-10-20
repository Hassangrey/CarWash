import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Models/CarWash.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/screens/Screens%201/laundry_main_screen.dart';
import 'package:safacw/screens/Screens%202/building_cleaning_main_screen.dart';
import 'package:safacw/screens/bottom_navigation_bar_holder.dart';
import 'package:safacw/screens/carwash_main_screen.dart';
import 'package:safacw/screens/choose_provider_screen.dart';
import '../widgets/serviceCard.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'welcomePage';

  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

changeId(CarWashProvider provider, String type) {
  if (type == "Laundry") {
    provider.type = '/NavigationBarHolder';
  } else if (type == "CarWash") {
    provider.type = '/carwashpage';
  } else if (type == "BuildingCleaning") {
    provider.type = '/BuildingCleaning';
  }
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var carProvider = Provider.of<CarWashProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const NetworkImage(
                'https://cdn.pixabay.com/photo/2019/03/03/20/23/flowers-4032775__340.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.2), BlendMode.modulate),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildServiceCard('Laundry', () {
                //  Provider.of<CarWashProvider>(context, listen: false)
                //   .getAllCarWashProvidersProfilers("Laundry");
                changeId(carProvider, "Laundry");
                Navigator.pushNamed(context, ChooseProvider.id);

                // go to laundry page
                // Navigator.pushNamed(context, NavBarHolder.id);
              }),
              buildServiceCard('Car Wash', () {
                Provider.of<CarWashProvider>(context, listen: false)
                    .getAllCarWashProvidersProfilers("CarWash");
                changeId(carProvider, "CarWash");

                Navigator.pushNamed(context, ChooseProvider.id);
                // Navigator.pushNamed(context, ChooseProvider.id);
                // * Fetch the service providers
              }),
              buildServiceCard('Building Cleaning', () {
                Provider.of<CarWashProvider>(context, listen: false)
                    .getAllCarWashProvidersProfilers("BuildingCleaning");
                changeId(carProvider, "BuildingCleaning");

                Navigator.pushNamed(context, ChooseProvider.id);

                // Navigator.pushNamed(context, BuildingCleaningMainScreen.id);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
