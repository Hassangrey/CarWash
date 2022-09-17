import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO 3: Make Cart page the contains a title, the laundry info (Name, photo, location)
// * Display list of items the user added in
// * A buttom to increment or decrement each item
// * Display the total price for all the items
class CartScreen extends StatelessWidget {
  static const String id = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Text('Cart Page', style: kServiceTitleStyle),
      ]),
    );
  }
}
