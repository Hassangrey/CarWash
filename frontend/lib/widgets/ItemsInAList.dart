import 'package:flutter/material.dart';
import 'package:safacw/screens/item_details_page.dart';
import '../screens/item_details_page.dart';
import 'Cards.dart';
import '../Models/Provider.dart';

class ItemsInAList extends StatelessWidget {
  ItemsInAList({Key? key, required this.provider}) : super(key: key);
  final Provider provider;

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
