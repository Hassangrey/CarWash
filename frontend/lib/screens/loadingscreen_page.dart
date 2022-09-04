// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('LOADING...',
        style: kCarItemNameStyle,),
      ),
    );
  }
}
