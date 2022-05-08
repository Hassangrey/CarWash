import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safacw/screens/cart_page.dart';
import 'package:safacw/widgets/BuyingOptions.dart';
import 'package:safacw/widgets/Description.dart';
import 'package:safacw/widgets/DetailPageBar.dart';
import 'package:safacw/widgets/HeadImage.dart';
import '../Models/Cart.dart';
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
                  BuyingOptions(),
                  Text("PRICE\n" + item.getPrice.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  TextButton(
      onPressed: () {
              // If the item is not in cart, we let the user add it.
              // We are using context.read() here because the callback
              // is executed whenever the user taps the button. In other
              // words, it is executed outside the build method.
              var cart = context.read<CartModel>();
              cart.add(item);
            },child: const Text('ADD'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
