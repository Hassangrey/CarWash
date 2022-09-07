import 'package:flutter/material.dart';
import 'package:safacw/widgets/page_layout.dart';
import '../Constants/appBarCustomized.dart';

class SettingsPage extends StatelessWidget {
  static const String id = 'SettingPage';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Text('Settings Page'),
      ]),
    );
  }
}
