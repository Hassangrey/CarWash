import 'package:flutter/material.dart';
import 'package:safacw/morePage.dart';
import 'package:safacw/carWashMain.dart';
import 'SliderMenu.dart';
import 'Constants/appBarCustomized.dart';
import 'package:safacw/Constants/Constants.dart';
import 'SettingsPage.dart';
import 'serviceCard.dart';

class WelcomePage extends StatelessWidget {
  static const String id = 'welcomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFbbe6f4),
      appBar: kappBarStyle('Welcome'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            width: double.infinity,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('SELECT A SERVICE', style: kTitleStyle,)),

              ],
            ),
          ),
          Expanded( // First two cards
            child: Row(
            children: [
              Expanded( // Left Card
                child: GestureDetector(
                onTap: (){
                  // go to laundry
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFFFAF0E6),
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage('images/laundry.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              ),
              Expanded( // Right Card
                child: GestureDetector(
                onTap: (){

                  Navigator.pushNamed(context, carWashMain.id);
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/CarWash.png'),
                      fit: BoxFit.contain,
                    ),
                    color: Color(0xFFFAF0E6),
                    borderRadius: BorderRadius.circular(25),

                  ),

                ),
              ),),
            ],

          ),),
          Expanded(
            child:  GestureDetector(
            onTap: (){
              // Go to building cleaning

            },
            child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFFFAF0E6),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('images/CarWash.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
          ),),
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              width: double.infinity,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('SELECT A SERVICE', style: kTitleStyle,)),

                ],
              ),
            ),
          ),
            ],
          ),


    );
  }
}
