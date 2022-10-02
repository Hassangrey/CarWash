import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showActionSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: COLOR_BLUE_LIGHT.withOpacity(0.9),
    padding: const EdgeInsets.all(12),
    behavior: SnackBarBehavior.fixed,
    duration: const Duration(seconds: 2),
    content: Text(
      message,
      style: TextStyle(color: COLOR_BLUE_DARK, fontSize: 16.sp),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
