import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:safacw/carWashMain.dart';
import 'package:safacw/screens/choose_provider_page.dart';
import '../../Constants/appBarCustomized.dart';
import 'LoginButton.dart';
import 'SelectServiceText.dart';
import 'ServicesCard.dart';
import 'SignUpPage.dart';


class WelcomePage extends StatelessWidget {
  static const String id = 'welcomePage';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Color(0xFFF1EAD2),
      appBar: kappBarStyle('Welcome'),
      body: Column(
          children: [
          SelectServiceText(title: 'choose a service'),
            ServiceCard(imgPath: 'images/CarWash.png',
              onPress: (){

              Navigator.pushNamed(context, ChooseProvider.id);
              },

            ),
            ServiceCard(imgPath: 'images/CarWash.png',
              onPress: (){

                Navigator.pushNamed(context, carWashMain.id);
              },

            ),
            ServiceCard(imgPath: 'images/CarWash.png',
              onPress: (){

                Navigator.pushNamed(context, carWashMain.id);
              },

            ),
            LoginButton(tital: 'Log In', color: Color(0xFFDBC6A5), onPress: (){
              // Go to Log in page
            }),
            LoginButton(tital: 'Sign Up', color: Color(0xFFC89F76), onPress: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, SignUpPage.id);
            }),
            SizedBox(
              height: 10,
            )

      ],
      ),
    );
  }
}
