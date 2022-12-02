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

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var carProvider = Provider.of<CarWashProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/cleaning_wall.jpg'),
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
                Provider.of<CarWashProvider>(context, listen: false)
                    .getAllCarWashProvidersProfilers("Laundry");
                carProvider.type = 'Laundry';
                Navigator.pushNamed(context, ChooseProvider.id);
                // go to laundry page
              }),
              buildServiceCard('Car Wash', () {
                Provider.of<CarWashProvider>(context, listen: false)
                    .getAllCarWashProvidersProfilers("CarWash");
                carProvider.type = 'CarWash';
                Navigator.pushNamed(context, ChooseProvider.id);
              }),
              buildServiceCard('Building Cleaning', () {
                Provider.of<CarWashProvider>(context, listen: false)
                    .getAllCarWashProvidersProfilers("BuildingCleaning");
                carProvider.type = 'BuildingCleaning';

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
