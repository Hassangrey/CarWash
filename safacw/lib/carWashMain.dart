import 'package:flutter/material.dart';
import 'package:safacw/HeaderWithSearchBar.dart';
import 'package:safacw/ItemsInAList.dart';
import 'package:safacw/MoreButton.dart';
import 'package:safacw/morePage.dart';
import 'HeadImage.dart';
import 'Models/Item.dart';
import 'Models/Provider.dart';
import 'SliderMenu.dart';
import 'Constants/appBarCustomized.dart';

class carWashMain extends StatelessWidget {
  static const String id = '/carwashpage';
  final Provider provider;

  const carWashMain ({required this.provider});



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SlideMenu(),
      appBar: kappBarStyle(''),
      body: Column(
        children: [
          HeaderWithSearchBar(providerName: provider.getName,),
          HeaderImage(imgPath: 'images/CarWash.png'),
          MoreButton(
            onPress: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, morePage.id);
            },
          ),
          ItemsInAList(provider: provider),

        ],
      ),
    );
  }
}
