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
    title: 'Small Car 2',
    price: 15,
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
              image: AssetImage('images/laundrybackgr.jpeg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.blue.withOpacity(0.2), BlendMode.modulate),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                DetailPageBar(
                    tital: item.title.toString(),
                    onPress: () {
                      Navigator.popAndPushNamed(context, CartPage.id);
                    }),
                DetailPageHeader(imgPath: 'images/smallcar.png'),
                InfoCard(
                  itemName: item.title.toString(),
                  price: '20',
                  desc:
                      'Oorem ipsum dolor sit amet. In debitis explicabo ab neque suscipit sed sapiente blanditiis sed modi eaque sed quia quia sit recusandae autem qui minus beatae? Et sunt alias ex ullam pariatur ut galisum alias ad odit praesentium et voluptas culpa 33 galisum iste. 33 distinctio quis id aliquam necessitatibus ut ullam earum non saepe velit eum architecto veniam non ipsum dolor.  ',
                  bothPrice: '20',
                  interiorPrice: '15',
                  exteriorPrice: '15',
                ),
                InkWell(
                  onTap: () {
                    var cart = context.read<CartModel>();
                    cart.add(item2);
                  },
                  splashColor: Colors.lightBlueAccent,
                  child: Ink(
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color(0xFFABE8FF),
                        borderRadius: BorderRadius.circular(30)),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
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
