import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class SelectServiceText extends StatelessWidget {
  const SelectServiceText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
                'SELECT A SERVICE',
                style: kTitleStyle,
              )),
        ],
      ),
    );
  }
}
