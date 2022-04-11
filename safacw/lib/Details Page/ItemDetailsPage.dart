import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/appBarCustomized.dart';
import 'package:safacw/HeadImage.dart';

import '../Models/Items.dart';

class ItemDetailsPage extends StatelessWidget {
  // const ItemDetailsPage({ required this.item});
  static const String id = 'ItemDetailsPage';
//  final Items item;



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: kappBarStyle(''),
      body: Column(
        children: [
          HeaderImage(imgPath: 'images/smallcar.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Small Car\n 15 RS',
                style: kTitleStyle,
              ),

            ],
          ),




        ],
      ),
    );
  }
}
