import 'package:flutter/material.dart';

import 'Constants/Constants.dart';

class RecHeader extends StatelessWidget {
  const RecHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Text('Services', style: kTitleStyle,
          ),
        ],
      ),

    );
  }
}
