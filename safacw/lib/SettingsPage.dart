import 'package:flutter/material.dart';
import 'Constants/appBarCustomized.dart';

class SettingsPage extends StatelessWidget {
  static const String id = 'SettingPage'; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kappBarStyle('Settings'),
    );
  }
}
