import 'package:flutter/material.dart';
import '../Constants/appBarCustomized.dart';
import 'package:safacw/widgets/SliderMenu.dart';
import 'package:safacw/Constants/Constants.dart';

class morePage extends StatelessWidget {
  static const String id = 'morePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kappBarStyle('Car Wash'),
      backgroundColor: Color(0xFFbbe6f4),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Car Wash',
              style: kServiceTitleStyle,
              textAlign: TextAlign.left,
            ),
            Divider(
              color: Colors.black12,
              thickness: 5,
            ),
            Padding(
              padding: EdgeInsets.only(top: 45),
              child: Container(
                height: MediaQuery.of(context).size.height - 300,
                child: ListView(
                  children: [
                    buildCarItem('images/smallcar.png', 'Small Car', '15 R.S'),
                    buildCarItem('images/smallcar.png', 'Small Car', '15 R.S'),
                    buildCarItem('images/smallcar.png', 'Small Car', '15 R.S'),
                    buildCarItem('images/smallcar.png', 'Small Car', '15 R.S'),
                    buildCarItem('images/smallcar.png', 'Small Car', '15 R.S'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildCarItem(String imgPath, String carName, String price) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Row(
            children: [
              Image(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
                height: 75,
                width: 75,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carName,
                    style: kCarItemNameStyle,
                  ),
                  Text(
                    price,
                    style: kCarItemPriceStyle,
                  )
                ],
              )
            ],
          )),
        ],
      ),
    ),
  );
}
