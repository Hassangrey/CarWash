import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safacw/screens/cart_page.dart';
import 'package:safacw/widgets/Description.dart';
import 'package:safacw/widgets/DetailPageBar.dart';
import 'package:safacw/widgets/HeadImage.dart';
import 'package:safacw/widgets/detail_page_image_header.dart';
import '../Models/Cart.dart';
import '../Models/Item.dart';
import '../widgets/detail_page_info_card.dart';

class ItemDetailsPage extends StatelessWidget {
  ItemDetailsPage(this.item, {Key? key}) : super(key: key);
  static const String id = '/ItemDetailsPage';
  Item item2 = new Item(
    title: 'CAR11761',
    price: 14,
  );
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/laundrybackgr.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.2), BlendMode.modulate),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                DetailPageBar(
                    tital: 'ITEM_NAME',
                    onPress: () {
                      Navigator.popAndPushNamed(context, CartPage.id);
                    }),
                const DetailPageHeader(imgPath: 'images/smallcar.png'),
                const InfoCard(
                  itemName: 'ITEM_NAME',
                  price: '10',
                  desc:
                      'Oorem ipsum dolor sit amet. In debitis explicabo ab neque suscipit sed sapiente blanditiis sed modi eaque sed quia quia sit recusandae autem qui minus beatae? Et sunt alias ex ullam pariatur ut galisum alias ad odit praesentium et voluptas culpa 33 galisum iste. 33 distinctio quis id aliquam necessitatibus ut ullam earum non saepe velit eum architecto veniam non ipsum dolor.  ',
                  bothPrice: '1',
                  interiorPrice: '2',
                  exteriorPrice: '3',
                ),
                GestureDetector(
                  onTap: () {
                    var cart = context.read<CartModel>();
                    cart.add(item2);
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xFFABE8FF),
                        borderRadius: BorderRadius.circular(30)),
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ), // ADD TO CART BUTTON
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
