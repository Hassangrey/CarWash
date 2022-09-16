import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Cart.dart';
import '../widgets/DetailPageBar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  static const String id = '/CardPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<CartModel>(builder: (context, cart, child) {
        return Column(
          children: [
            DetailPageBar(tital: 'CART', onPress: () {}),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                  // The list of items
                  // width: double.infinity,
                  height: 500,
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
                "The total cost is: " + "${total(item)}" + "SR",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: Container(
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
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ), // ADD TO CART BUTTON
              ),
            )
          ],
        );
      }),
    ));
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
  {"carSize": "Small Car", "service": "Internal", "cost": 20},
  {"carSize": "Large Car", "service": "External", "cost": 30},
  {"carSize": "Small Car", "service": "Both", "cost": 40}
];
