import 'package:flutter/material.dart';

class DetailPageBar extends StatelessWidget {
  const DetailPageBar({Key? key, required this.tital, required this.onPress}) : super(key: key);
  final String tital;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              }),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "CAR WASH",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 14),
                ),
                Text(
                  tital.toUpperCase(),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F2F3E)),
                ),
              ],
            ),
          ),
          IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: onPress),

        ],
      ),
    );
  }
}
