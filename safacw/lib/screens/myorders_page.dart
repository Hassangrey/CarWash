import 'package:flutter/material.dart';

import '../widgets/DetailPageBar.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);
  static const String id = '/MyOrders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DetailPageBar(tital: 'ORDERS', onPress: () {}),
            Container(
                // The list of items
                // width: double.infinity,
                height: 500,
                child: ListView.builder(
                  // to build the list
                  itemCount: order.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      // The list
                      title:
                          Text("order number #" + "${order[i]['orderNumber']}"),
                      subtitle: Text(
                        "${order[i]['type']}",
                        style: TextStyle(
                            color: "${order[i]['type']}" == "Ongoing"
                                ? Colors.amber[600]
                                : Colors.red),
                      ),
                      leading: Icon(Icons.insert_emoticon),
                      trailing: Text("${order[i]['cost']}" + "SR"),
                      onTap: () => showDialog(
                          // the window appears on Tap
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Back"))
                              ],
                              // title:
                              //     Text("Alert: ", style: TextStyle(fontSize: 15)),
                              content: Text(
                                "${order[i]['Discription']}" +
                                    "${order[i]['orderNumber']}",
                                style: TextStyle(fontSize: 13),
                              ),
                            );
                          }),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

List order = [
  {
    "orderNumber": "26522",
    "type": "Ongoing",
    "cost": 20,
    "Discription": "This a discription for order number: "
  },
  {
    "orderNumber": "55121",
    "type": "Ongoing",
    "cost": 30,
    "Discription": "This a discription for order number: "
  },
  {
    "orderNumber": "56485",
    "type": "Finished",
    "cost": 40,
    "Discription": "This a discription for order number: "
  }
];
// The sum function
double total(List x) {
  var sum = 0.0;
  for (var i = 0; i < x.length; i++) {
    sum += x[i]['cost'];
  }
  return sum;
}
