import 'package:flutter/material.dart';
import 'package:safacw/screens/item_details_screen.dart';
import '../screens/item_details_screen.dart';
import 'Cards.dart';
import 'package:safacw/Models/CarWash.dart';

class ItemsInAList extends StatelessWidget {
  ItemsInAList({Key? key, required this.provider}) : super(key: key);
  final CarWash provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < provider.items!.length; i++)
            Cards(
                item: provider.items![i],
                onPress: () {
                  Navigator.pushNamed(context, ItemDetailsPage.id,
                      arguments: provider.items![i]);
                }),
        ],
      ),
    );
  }
}
