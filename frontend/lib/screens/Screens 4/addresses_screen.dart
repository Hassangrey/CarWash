import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO 5: Make a page that displays the saved addresses for the user
// * Add a new address, or delete/update an existant address

class AddressesScreen extends StatelessWidget {
  static const String id = 'Addresses Screen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Text(
          'Addresses Screen',
          style: kServiceTitleStyle,
        ),
      ]),
    );
  }
}
