import 'package:flutter/material.dart';
class serviceCardContainer extends StatelessWidget {
  serviceCardContainer( this.cardChild, this.onPress);

  final Widget cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        color: Colors.teal,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}