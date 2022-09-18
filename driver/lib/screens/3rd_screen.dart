import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/screens/orderDetails.dart';
import 'package:safacw/screens/settings_page.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);
  static const String id = '/3rdScreen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(children: [
        Container(
          child: Text('Select an order:'),
          margin: EdgeInsets.only(bottom: 20),
        ),
        InkWell(
          onTap: () => {
            showBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(children: [
                    Container(
                      margin: EdgeInsets.all(10.sm),
                      child: Text(
                        'The order details appear here!',
                        textAlign: TextAlign.center,
                      ),
                      height: 200.h,
                      width: 420.w,
                    ),
                    Center(
                      child: Container(
                          margin: EdgeInsets.all(5.sm),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(40.r)),
                          height: 40.h,
                          width: 210.w,
                          child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                    context,
                                    orderDetails.id,
                                  ),
                              child: Center(
                                child: Text(
                                  'More details',
                                ),
                              ))),
                    )
                  ]);
                })
          },
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(40)),
              height: 50,
              child: Center(child: Text('Order 1'))),
        ),
      ]),
    );
  }
}
