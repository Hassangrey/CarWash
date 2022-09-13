import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/widgets/page_layout.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);
  static const String id = '/OrderHistoryScreen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Container(
          child: Text('Orders History'),
          margin: EdgeInsets.only(bottom: 20),
        ),
        InkWell(
          onTap: () => print('object'),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(40)),
              width: 300,
              height: 50,
              child: Center(child: Text('Order 1'))),
        ),
      ]),
    );
  }
}
