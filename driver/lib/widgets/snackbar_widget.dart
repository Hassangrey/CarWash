import 'package:flutter/material.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
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

// ? COLORS WILL BE USED IN STYLYING THE APP
const COLOR_BLUE_DARK = Color.fromARGB(255, 51, 75, 139);
const COLOR_BLUE_LIGHT = Color(0xFFABC9F2);
const COLOR_GREY = Color(0xFFA7A7A7);
const COLOR_TRY = Color(0xFFCEDDEF);

const kPrimaryColor = Color(0xFF46B4E7);
const double kDefaultPadding = 20;
const kWashTypeBackground = Colors.white70;

const kTitleStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Color(0xFFAD9276),
);

TextStyle kServiceTitleStyle = TextStyle(
  color: COLOR_BLUE_DARK,
  fontWeight: FontWeight.w700,
  fontSize: 24.sp,
);

const kDropButtonStyle = TextStyle(
  fontSize: 24,
  color: Colors.grey,
  fontWeight: FontWeight.w500,
);

const kCarItemNameStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

const kCarItemPriceStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: COLOR_BLUE_DARK,
);

const kItemNameStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w600,
);

const kDescStyle = TextStyle(
  fontSize: 15,
  color: Colors.grey,
);

const kChooseTypeStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

const selectedOption = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Color(0xFF1565C0FF),
);
const unselectedOption = TextStyle(fontSize: 25, color: Colors.lightBlueAccent);
