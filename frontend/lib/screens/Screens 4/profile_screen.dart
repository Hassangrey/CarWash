import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';

// TODO 6: Make a page that displays the user info (Name, email, phone number)
// * Update the info (Email, password, or name)

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Text('Profile Screen', style: kServiceTitleStyle),
      ]),
    );
  }
}
