import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO 2: Make laundry page the contains a title, list of offers
// * List of items

class BuildingCleaningMainScreen extends StatelessWidget {
  static const String id = 'BuildingCleaning';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Text('Building Cleaning Screen', style: kServiceTitleStyle),
      ]),
    );
  }
}
