import 'package:flutter/material.dart';
import 'package:safacw/Details%20Page/ItemDetailsPage.dart';
import 'package:safacw/Models/Items.dart';
import 'Details Page/ItemDetailsPage.dart';

import 'Cards.dart';

class ItemsInAList extends StatelessWidget {
  const ItemsInAList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          Cards(
              item: new Items(
                  title: 'Small Car 1',
                  price: 15,
                  imgPath: 'images/smallcar.png'
              ),
              onPress: () {
               // deails page
          }),
          Cards(
              item: new Items(
                  title: 'Small Car 2',
                  price: 15,
                  imgPath: 'images/smallcar.png'
              ),
              onPress: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, ItemDetailsPage.id);
              }),
          Cards(
              item: new Items(
                  title: 'Small Car 3',
                  price: 15,
                  imgPath: 'images/smallcar.png'
              ),
              onPress: () {
                // deails page
              }),

        ],
      ),
    );
  }
}
