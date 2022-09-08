import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/Models/language_constants.dart';
import 'package:safacw/main.dart';

class PageLayout extends StatelessWidget {
  final Widget child;
  const PageLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,

      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFF292E49),
                Color(0xFF536976),
              ])),
        ),
        Positioned.fill(
          top: 100.h,
          bottom: 100.h,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.r),
                topLeft: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r),
                bottomLeft: Radius.circular(50.r),
              ),
            ),
            child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0.h),
                  child: child,
                )),
          ),
        ),
      ]),
    );
  }
}
