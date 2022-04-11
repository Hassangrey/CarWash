import 'package:flutter/material.dart';

kappBarStyle(String title) {
  return AppBar(
    title: Text(title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Color(0xFF46B4E7),
    centerTitle: true,
  );
}




