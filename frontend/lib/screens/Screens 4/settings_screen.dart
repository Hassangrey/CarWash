import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/screens/Screens 4/addresses_screen.dart';
import 'package:safacw/screens/Screens 4/profile_screen.dart';


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

        // Profile Screen button
        SizedBox(height: 75,),
        Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          height: 60,
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, ProfileScreen.id);
            },
            child: Align(
              child: 
                Text('Profile',style: TextStyle(fontSize: 30, color: Colors.white) )
            )
          ) ,
        ),

        // Address Screen button
        SizedBox(height: 45,),
        Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          height: 60,
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, AddressesScreen.id);
            },
            child: Align(
              child: 
                Text('Address',style: TextStyle(fontSize: 30, color: Colors.white) )
            )
          ) ,
        ),

        
      ]),
    );
  }



}
