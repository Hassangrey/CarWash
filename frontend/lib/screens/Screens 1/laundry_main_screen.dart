import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/models/language_constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO 1: Make laundry page the contains a title, list of offers
// * Display List of items that the provider got

class LaundryMainScreen extends StatelessWidget {
  static const String id = 'LaundryScreen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Text(translation(context).home_page_string, style: kServiceTitleStyle),
      ]),
    );
  }
}
