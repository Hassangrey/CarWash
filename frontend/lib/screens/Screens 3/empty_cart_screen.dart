import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/addspace_functions.dart';
import 'package:safacw/screens/bottom_navigation_bar_holder.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: LottieBuilder.asset('assets/images/empty-cart.json'),
          ),
          addVerticalSpace(40.h),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'Your cart is empty! \n ',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: COLOR_BLUE_DARK,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'Add items ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: COLOR_BLUE_DARK,
                    fontWeight: FontWeight.w900,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, NavBarHolder.id);
                      print('h');
                    },
                ),
                TextSpan(
                  text: 'and they will show here!',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: COLOR_BLUE_DARK,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
