import 'package:flutter/material.dart';
import 'package:safacw/Details%20Page/BuyingOptions.dart';
import 'package:safacw/Details%20Page/Description.dart';
import 'package:safacw/Details%20Page/DetailPageBar.dart';
import 'package:safacw/HeadImage.dart';

import '../Models/Item.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage(this.item, {Key? key}) : super(key: key);
  static const String id = '/ItemDetailsPage';
  final Item item;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DetailPageBar(tital: item.getTitle, onPress: () {}),
            HeaderImage(imgPath: item.getPath),
            Description(desc: item.getDesc),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuyingOptions(),
                Text("PRICE\n" + item.getPrice.toString() ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
