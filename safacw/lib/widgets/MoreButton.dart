import 'package:flutter/material.dart';
import '../screens/more_items_page.dart';
import '../Constants/Constants.dart';
import 'RecommendationsHeader.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({required this.onPress});

  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          RecHeader(),
          Spacer(),
          FlatButton(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'More',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onPressed: onPress,
          ),
        ],
      ),
    );
  }
}
