import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safacw/screens/confirmed_order_page.dart';

import '../Models/Cart.dart';
import '../widgets/DetailPageBar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  static const String id = '/CardPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
            child: Consumer<CartModel>(
          builder: (context, cart, child) {
        return Column(
          children: [
            DetailPageBar(tital: 'CART', onPress: () {}),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                  // The list of items
                  // width: double.infinity,
                  height: 250,
                  child: ListView.builder(
                    // to build the list
                    itemCount: cart.items.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        // The list
                        title: Text("${cart.items[i].title}"),
                        subtitle: Text("${cart.items[i].price}" +
                            "SR" "     " +
                            "${item[i]['service']}"),
                        leading: Image.asset('images/smallcar.png'),
                        trailing: Icon(Icons.delete_sharp),
                      );
                    },
                  )),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "The total cost is: 30 SR",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ConfirmOrder.id);
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
                    'CONFIRM',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ), // ADD TO CART BUTTON
              ),
            )
          ],
        );
          }),)
    );
  }
}

// The sum function
double total(List x) {
  var sum = 0.0;
  for (var i = 0; i < x.length; i++) {
    sum += x[i]['cost'];
  }
  return sum;
}

List item = [
  {"carSize": "Small Car", "service": "Internal", "cost": 10},
  {"carSize": "Large Car", "service": "External", "cost": 10},
  {"carSize": "Small Car", "service": "Both", "cost": 0}
];
