import 'dart:developer';

import 'package:flutter/material.dart';
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
      appBar: kappBarStyle('Welcome'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/laundrybackgr.jpeg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.blue.withOpacity(0.2), BlendMode.modulate),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              buildServiceCard('', 'images/comingsoon.png', () {
                // go to laundry page
              }),
              buildServiceCard('Car Wash', 'images/laundrybackg.jpeg', () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChooseProvider(),
                  ),
                );
              }),
              buildServiceCard('', 'images/comingsoon.png', () {
                // go to building cleaning page
              }),
              SizedBox(
                height: 30,
              ),
              LoginButton(
                  tital: 'Log In',
                  color: Color(0xFF46C7FF),
                  onPress: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, LoginScreen.id);                  }),
              LoginButton(
                  tital: 'Sign Up',
                  color: Color(0xFF239BFE),
                  onPress: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, SignUpPage.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
