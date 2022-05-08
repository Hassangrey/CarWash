// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:safacw/widgets/buying_options.dart';

import '../Constants/Constants.dart';

class CardInfoText extends StatefulWidget {
  const CardInfoText({Key? key, required this.itemName, required this.price, required this.desc, required this.bothPrice, required this.interiorPrice, required this.exteriorPrice}) : super(key: key);
  final String itemName;
  final String price;
  final String desc;
  final String bothPrice;
  final String interiorPrice;
  final String exteriorPrice;


  @override
  State<CardInfoText> createState() => _CardInfoTextState();
}

class _CardInfoTextState extends State<CardInfoText> {
  @override
  Widget build(BuildContext context) {
    int selectedValue = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.itemName,
              style: kItemNameStyle,
            ),
            Text(
              '\$' + widget.price + '.0',
              style: kItemNameStyle,
            ),
          ],
        ),
        SizedBox(height: 30),
        Text(
            widget.desc,
            style: kDescStyle),
        SizedBox(height: 30),
        Text('Choose Washing Type', style: kChooseTypeStyle),
        SizedBox(height: 10),
        BuyingOptions(
          bothPrice: widget.bothPrice,
          exteriorPrice: widget.exteriorPrice,
          interiorPrice: widget.interiorPrice),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Color(0xFFABE8FF),
                borderRadius: BorderRadius.circular(30)),
            width: double.infinity,
            child: Center(
              child: Text(
                'ADD TO CART',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),// ADD TO CART BUTTON
          ),
        )
      ],
    );
  }
}
