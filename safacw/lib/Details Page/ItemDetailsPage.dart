import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/appBarCustomized.dart';
import 'package:safacw/HeadImage.dart';

import '../Models/Items.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage(this.items, {Key? key}) : super(key: key);
  static const String id = '/ItemDetailsPage';
  final Items items;
//  final Items item;



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: kappBarStyle(''),
      body: Column(
        children: [
          HeaderImage(imgPath: items.getPath),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                items.getTitle,
                style: kTitleStyle,
              ),

            ],
          ),




        ],
      ),
    );
  }
}
