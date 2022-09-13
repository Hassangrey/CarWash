import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:safacw/screens/bottom_navigation_bar_holder.dart';
import 'package:safacw/screens/login_screen.dart';
import 'package:safacw/screens/carwash_mainpage.dart';
import 'package:safacw/screens/choose_provider_page.dart';
import 'package:safacw/screens/signup_page.dart';
import '../../Constants/appBarCustomized.dart';
import '../widgets/serviceCard.dart';
import '../services/address_service.dart';
import '../services/provider_service.dart';
import '../widgets/LoginButton.dart';
import '../widgets/SelectServiceText.dart';
import '../widgets/ServicesCard.dart';

class WelcomePage extends StatelessWidget {
  static const String id = 'welcomePage';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
                Navigator.pushNamed(context, NavBarHolder.id);
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
