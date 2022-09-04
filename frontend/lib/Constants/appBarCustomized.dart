import 'package:flutter/material.dart';

kappBarStyle(String title) {
  return AppBar(
    title: Text(title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(0xFFADD8E7),
      ),
    ),
    backgroundColor: Color(0xFF213F84),
    centerTitle: true,
  );
}




