import 'package:flutter/material.dart';
import 'package:safacw/Details%20Page/ItemDetailsPage.dart';
import 'package:safacw/Models/Items.dart';
import 'Details Page/ItemDetailsPage.dart';

import 'Cards.dart';

class ItemsInAList extends StatelessWidget {
  ItemsInAList({Key? key}) : super(key: key);
  final List<Items> items = [new Items(
      title: 'Small Car 1',
      price: 15,
      imgPath: 'images/smallcar.png',

  ),
    new Items(
    title: 'Small Car 2',
    price: 15,
    imgPath: 'images/smallcar.png',
    ),

    new Items(
      title: 'Small Car 3',
      price: 15,
      imgPath: 'images/smallcar.png',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          Cards(
              item: items[0],
              onPress: () {
                Navigator.pushNamed(context, '/ItemDetailsPage', arguments: items[0]);

                // deails page
          }),
          Cards(
              item: items[1],
              onPress: () {
                Navigator.pushNamed(context, '/ItemDetailsPage', arguments: items[1]);
              }),
          Cards(
              item: new Items(
                  title: 'Small Car 3',
                  price: 15,
                  imgPath: 'images/smallcar.png'
              ),
              onPress: () {
                Navigator.pushNamed(context, ItemDetailsPage.id, arguments: items[2]);              }),

        ],
      ),
    );
  }
}
