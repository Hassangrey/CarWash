import 'package:flutter/material.dart';
import 'package:safacw/Details%20Page/ItemDetailsPage.dart';
import 'package:safacw/Models/Item.dart';
import 'Details Page/ItemDetailsPage.dart';

import 'Cards.dart';

class ItemsInAList extends StatelessWidget {
  ItemsInAList({Key? key}) : super(key: key);
  final List<Item> items = [
    new Item(
      title: 'Small Car 1',
      price: 15,
      imgPath: 'images/smallcar.png',
      desc: 'This is a service for small car where you can wash the external, internal part of your car or both!',

    ),
    new Item(
      title: 'Small Car 2',
      price: 15,
      imgPath: 'images/smallcar.png',
      desc: 'This is a service for small car where you can wash the external, internal part of your car or both!',

    ),
    new Item(
      title: 'Small Car 3',
      price: 15,
      imgPath: 'images/bigcar.png',
      desc: 'This is a service for small car where you can wash the external, internal part of your car or both!',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < items.length; i++)
            Cards(
                item: items[i],
                onPress: () {
                  Navigator.pushNamed(context, ItemDetailsPage.id,
                      arguments: items[i]);

                }),
        ],
      ),
    );
  }
}
