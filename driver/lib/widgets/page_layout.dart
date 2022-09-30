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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0.h), // here the desired height
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Safa',
            style: TextStyle(
              fontSize: 36,
              letterSpacing: 4,
              color: Colors.black45,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final locale = Localizations.localeOf(context);
                Locale _locale = await setLocale(locale.languageCode);
                Safa.setLocale(context, _locale);
              },
              child: Text(
                translation(context).language,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
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
                  padding: EdgeInsets.only(top: 16.0.h, bottom: 16.0.h),
                  child: child,
                )),
          ),
        ),
      ]),
    );
  }
}
