import 'package:flutter/material.dart';
import 'package:safacw/screens/cart_page.dart';
import 'package:safacw/widgets/Description.dart';
import 'package:safacw/widgets/DetailPageBar.dart';
import 'package:safacw/widgets/HeadImage.dart';
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
            DetailPageBar(tital: item.getTitle, onPress: () {
              Navigator.popAndPushNamed(context, CartPage.id);

            }),
            HeaderImage(imgPath: item.getPath),
            Description(desc: item.getDesc),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("PRICE\n" + item.getPrice.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
