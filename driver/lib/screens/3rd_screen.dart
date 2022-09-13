import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/widgets/page_layout.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);
  static const String id = '/3rdScreen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Container(
          child: Text('Select an order:'),
          margin: EdgeInsets.only(bottom: 20),
        ),
        InkWell(
          onTap: () => print('object'),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(40)),
              height: 50,
              child: Center(child: Text('Order 1'))),
        ),
      ]),
    );
  }
}
