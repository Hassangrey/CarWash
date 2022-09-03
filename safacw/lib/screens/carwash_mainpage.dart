import 'package:flutter/material.dart';
import 'package:safacw/widgets/HeaderWithSearchBar.dart';
import 'package:safacw/widgets/ItemsInAList.dart';
import 'package:safacw/widgets/MoreButton.dart';
import 'package:safacw/screens/more_items_page.dart';
import '../widgets/HeadImage.dart';
import '../Models/Item.dart';
import '../Models/Provider.dart';
import '../widgets/SliderMenu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarWashMain extends StatelessWidget {
  static const String id = '/carwashpage';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0.h), // here the desired height
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Safa',
            style: TextStyle(
                fontSize: 36, letterSpacing: 4, color: Colors.black26),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF7AD7F0),
                Color(0xFFDBF3FA),
                Color(0xFFB7E9F7),
              ])),
        ),
        Positioned.fill(
          top: 180.h,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.r),
                topLeft: Radius.circular(50.r),
              ),
            ),
            child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0.h),
                )),
          ),
        ),
      ]),
    );
  }
}
