import 'package:flutter/material.dart';

import '../widgets/DetailPageBar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  static const String id = '/CardPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DetailPageBar(tital: 'CART', onPress: () {}
            ),
            Container(
              // The list of items
              // width: double.infinity,
                height: 500,
                child: ListView.builder(
                  // to build the list
                  itemCount: item.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      // The list
                      title: Text("${item[i]['carSize']}"),
                      subtitle: Text("${item[i]['service']}"),
                      leading: Icon(Icons.car_rental),
                      trailing: Text("${item[i]['cost']}" + "SR"),
                      onTap: () => showDialog(
                        // the window appears on Tap
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      ;
                                    },
                                    child: Text("Yes")),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"))
                              ],
                              // title:
                              //     Text("Alert: ", style: TextStyle(fontSize: 15)),
                              content: Text(
                                "Do you want to delete the " +
                                    "${item[i]['carSize']}",
                                style: TextStyle(fontSize: 13),
                              ),
                            );
                          }),
                    );
                  },
                )),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "The total cost is: " + "${total(item)}" + "SR",
                style: TextStyle(fontSize: 18),
              ),
            )

          ],
        ),
      ),
    );
  }
}
List item = [
  {"carSize": "Small Car", "service": "Internal", "cost": 20},
  {"carSize": "Large Car", "service": "External", "cost": 30},
  {"carSize": "Small Car", "service": "Both", "cost": 40}
];
// The sum function
double total(List x) {
  var sum = 0.0;
  for (var i = 0; i < x.length; i++) {
    sum += x[i]['cost'];
  }
  return sum;
}