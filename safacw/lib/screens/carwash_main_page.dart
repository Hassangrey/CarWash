import 'package:flutter/material.dart';
import 'package:safacw/widgets/HeaderWithSearchBar.dart';
import 'package:safacw/widgets/ItemsInAList.dart';
import 'package:safacw/widgets/MoreButton.dart';
import 'package:safacw/screens/more_items_page.dart';
import '../widgets/HeadImage.dart';
import '../Models/Item.dart';
import '../Models/Provider.dart';
import '../widgets/SliderMenu.dart';
import '../Constants/appBarCustomized.dart';

class CarWashMain extends StatelessWidget {
  static const String id = '/carwashpage';
  final Provider provider;

  const CarWashMain ({required this.provider});



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
