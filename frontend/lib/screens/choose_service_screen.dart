import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Models/Provider.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/screens/choose_provider_page.dart';
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2019/03/03/20/23/flowers-4032775__340.png'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.blue.withOpacity(0.2), BlendMode.modulate),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildServiceCard('Laundry -SOON-', () {
                // go to laundry page
              }),
              buildServiceCard('Car Wash', () {
                Navigator.pushNamed(context, ChooseProvider.id);

                Provider.of<CarWashProvider>(context, listen: false)
                    .getAllCarWashProvidersProfilers();
              }),
              buildServiceCard('Builfing Cleaning -SOON', () {
                // go to building cleaning page
              }),
              SizedBox(
                height: 30,
              ),
              // LoginButton(
              //     tital: 'Log In',
              //     color: Color(0xFF46C7FF),
              //     onPress: () {
              //       Navigator.of(context).pop();
              //       Navigator.pushNamed(context, LoginScreen.id);
              //     }),
              // LoginButton(
              //     tital: 'Sign Up',
              //     color: Color(0xFF239BFE),
              //     onPress: () {
              //       Navigator.of(context).pop();
              //       Navigator.pushNamed(context, SignUpPage.id);
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
