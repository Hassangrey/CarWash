import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:safacw/carWashMain.dart';
import 'package:safacw/screens/choose_provider_page.dart';
import '../../Constants/appBarCustomized.dart';
import '../serviceCard.dart';
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

      appBar: kappBarStyle('Welcome'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage (
            image: AssetImage('images/laundrybackg.jpeg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop),

            ),
          ),

        child: Column(
          children: [
            SelectServiceText(title: 'choose a service'),
            buildServiceCard(),
            buildServiceCard(),
            buildServiceCard(),
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
        
          
         

      
      ),
    );
  }
}
