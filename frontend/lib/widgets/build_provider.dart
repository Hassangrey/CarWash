import 'package:flutter/material.dart';
import 'package:safacw/screens/carwash_mainpage.dart';
import '../Constants/Constants.dart';
import '../Models/Item.dart';
import '../Models/Provider.dart';

Widget buildProvider(Provider provider, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CarWashMain(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Row(
            children: [
              Image(
                image: AssetImage(provider.getImgPath),
                fit: BoxFit.cover,
                height: 75,
                width: 75,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.getName,
                    style: kCarItemNameStyle,
                  ),
                  Text(
                    provider.getDesc,
                    style: kCarItemPriceStyle,
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    ),
  );
}
