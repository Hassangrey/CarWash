import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/widgets/page_layout.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String id = '/SettingsPage';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Center(
          child: Text('Settings Page'),
        ),
      ]),
    );
  }
}
