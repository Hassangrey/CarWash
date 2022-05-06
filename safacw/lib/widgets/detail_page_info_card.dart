import 'package:flutter/material.dart';

import '../Constants/Constants.dart';
import 'detail_page_infoText.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.itemName, required this.price, required this.desc, required this.bothPrice, required this.interiorPrice, required this.exteriorPrice}) : super(key: key);
  final String itemName;
  final String price;
  final String desc;
  final String bothPrice;
  final String interiorPrice;
  final String exteriorPrice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 50, right: 20, left: 20),
          height: MediaQuery.of(context).size.height * 0.65,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: CardInfoText(
            itemName: itemName,
            price: price,
            desc: desc,
            bothPrice: bothPrice,
            interiorPrice: interiorPrice,
            exteriorPrice: exteriorPrice,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        )
      ],
    );
  }
}
