import 'package:flutter/material.dart';
import 'package:safacw/widgets/buying_options.dart';

import '../Constants/Constants.dart';

class CardInfoText extends StatefulWidget {
  const CardInfoText({Key? key}) : super(key: key);


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
              'ITEM_NAME',
              style: kItemNameStyle,
            ),
            Text(
              '\$0.00',
              style: kItemNameStyle,
            ),
          ],
        ),
        SizedBox(height: 30),
        Text(
            'Lorem ipsum dolor sit amet. In debitis explicabo ab neque suscipit sed sapiente blanditiis sed modi eaque sed quia quia sit recusandae autem qui minus beatae? Et sunt alias ex ullam pariatur ut galisum alias ad odit praesentium et voluptas culpa 33 galisum iste. 33 distinctio quis id aliquam necessitatibus ut ullam earum non saepe velit eum architecto veniam non ipsum dolor.  ',
            style: kDescStyle),
        SizedBox(height: 30),
        Text('Choose Washing Type', style: kChooseTypeStyle),
        SizedBox(height: 10),
        BuyingOptions(),
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
                  color: Colors.white54,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
