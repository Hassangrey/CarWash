import 'package:flutter/material.dart';
import 'package:safacw/Cart%20Page/myorders_page.dart';
import 'package:safacw/Welcome%20Page/WelcomePage.dart';
import 'package:safacw/SettingsPage.dart';
class SlideMenu extends StatelessWidget {
  static const String id = 'SlideMenu';

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          children: <Widget> [
           Container(
               child: DrawerHeader(
                 child: CircleAvatar(
                   radius: 5,
                   child: Image.asset('images/profile_pic.png',
                   ),



                 ),
               ),
           ),
            ListTile(
              title: Text('Home'),
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, WelcomePage.id, (route) => false);
              },

            ),
            ListTile(
              title: Text('New Order'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, MyOrdersPage.id);
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, SettingsPage.id);
              },

            ),
          ],
        ),
    );
  }
}
