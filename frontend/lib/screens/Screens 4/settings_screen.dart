import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'SettingsScreen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Text(
          'Settings Screen',
          style: kServiceTitleStyle,
        ),
      ]),
    );
  }
}
