import 'package:flutter/material.dart';

import '../Constants/Constants.dart';
import '../Models/Item.dart';

class Cards extends StatelessWidget {
  const Cards({
    required this.item,
    required this.onPress,
  });

  final Item item;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2.5,
        ),
        width: screenSize.width * 0.4,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: kPrimaryColor.withOpacity(0.5)),
        ),
        child: Column(
          children: [
            Image.asset('images/smallcar.png',
                fit: BoxFit.fill),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                color: Colors.white24,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  )
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: item.title.toString().toUpperCase() + '\n',
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: ('14 RS'),
                         // text: item.price.toString() + ' RS',
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
