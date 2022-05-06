import 'package:flutter/material.dart';
import 'package:safacw/screens/cart_page.dart';
import 'package:safacw/widgets/Description.dart';
import 'package:safacw/widgets/DetailPageBar.dart';
import 'package:safacw/widgets/HeadImage.dart';
import 'package:safacw/widgets/detail_page_image_header.dart';
import '../Models/Item.dart';
import '../widgets/detail_page_info_card.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage(this.item, {Key? key}) : super(key: key);
  static const String id = '/ItemDetailsPage';
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
                DetailPageBar(tital: 'ITEM_NAME', onPress: () {}),
                DetailPageHeader(imgPath: 'images/smallcar.png'),
                InfoCard(
                  itemName: 'ITEM_NAME',
                  price: '10',
                  desc: 'Oorem ipsum dolor sit amet. In debitis explicabo ab neque suscipit sed sapiente blanditiis sed modi eaque sed quia quia sit recusandae autem qui minus beatae? Et sunt alias ex ullam pariatur ut galisum alias ad odit praesentium et voluptas culpa 33 galisum iste. 33 distinctio quis id aliquam necessitatibus ut ullam earum non saepe velit eum architecto veniam non ipsum dolor.  ',
                  bothPrice: '1',
                  interiorPrice: '2',
                  exteriorPrice: '3',
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
