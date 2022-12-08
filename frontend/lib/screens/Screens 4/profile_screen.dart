import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';

import '../../widgets/snackbar_widget.dart';

// TODO 6: Make a page that displays the user info (Name, email, phone number)
// * Update the info (Email, password, or name)

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Text('Profile Screen', style: kServiceTitleStyle),

        // Change Name

        const SizedBox(
          height: 45,
        ),
        Container(
          child: const Text(
            'Change your name',
            style: TextStyle(fontSize: 20),
          ),
        ),

        const SizedBox(
          height: 10,
        ),
        const TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              hintText: 'New Name', prefixIcon: Icon(Icons.person)),
        ),
        Column(
          children: [
            TextButton(
                onPressed: () {
                  showActionSnackBar(context, 'Your name has been change!');
                },
                child: const Text('Change'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blueAccent,
                ))
          ],
        ),
        // Change Email

        const SizedBox(
          height: 25,
        ),
        Container(
          child: const Text(
            'Change your Email',
            style: TextStyle(fontSize: 20),
          ),
        ),

        const SizedBox(
          height: 10,
        ),
        const TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'New Email', prefixIcon: Icon(Icons.email)),
        ),
        Column(
          children: [
            TextButton(
                onPressed: () {
                  showActionSnackBar(context, 'Your Email has been change!');
                },
                child: const Text('Change'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blueAccent,
                ))
          ],
        ),

        // Change Password

        const SizedBox(
          height: 25,
        ),
        Container(
          child: const Text(
            'Change your Password',
            style: TextStyle(fontSize: 20),
          ),
        ),

        // Old Password

        const SizedBox(
          height: 10,
        ),
        const TextField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              hintText: 'Old Password', prefixIcon: Icon(Icons.password)),
        ),

        // New Password
        const TextField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              hintText: 'New Password', prefixIcon: Icon(Icons.password)),
        ),
        Column(
          children: [
            TextButton(
                onPressed: () {
                  showActionSnackBar(context, 'Your Password has been change!');
                },
                child: const Text('Change'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blueAccent,
                ))
          ],
        ),
      ]),
    );
  }
}
