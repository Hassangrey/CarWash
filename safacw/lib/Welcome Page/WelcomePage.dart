import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:safacw/Welcome%20Page/SelectServiceText.dart';
import 'package:safacw/Welcome%20Page/ServicesCard.dart';
import 'package:safacw/morePage.dart';
import 'package:safacw/carWashMain.dart';
import '../SliderMenu.dart';
import '../Constants/appBarCustomized.dart';
import 'package:safacw/Constants/Constants.dart';
import '../SettingsPage.dart';
import '../serviceCard.dart';

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
          SelectServiceText(),
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
            ServiceCard(imgPath: 'images/CarWash.png',
              onPress: (){

                Navigator.pushNamed(context, carWashMain.id);
              },

            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Color(0xFFDBC6A5),
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Color(0xFFC89F76),
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )

      ],
      ),
    );
  }
}
