import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safacw/screens/cart_page.dart';
import 'package:safacw/widgets/Description.dart';
import 'package:safacw/widgets/DetailPageBar.dart';
import 'package:safacw/widgets/HeadImage.dart';
import '../Models/Cart.dart';
import '../Models/Item.dart';
import '../widgets/buying_options.dart';
import '../widgets/detail_page_image_header.dart';
import '../widgets/detail_page_info_card.dart';

class ItemDetailsPage extends StatelessWidget {
   ItemDetailsPage(this.item, {Key? key}) : super(key: key);
  static const String id = '/ItemDetailsPage';
  final Item item;

  @override
  Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;

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

            
            HeaderImage(imgPath: item.getPath),
            Description(desc: item.getDesc),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 // const BuyingOptions(),
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
            },
            child: const Text('ADD'))
                ],
              ),
            )
          ], //done
        ),//done
      ), //done
      ) //done
      ));//done
  } //done
} //done
