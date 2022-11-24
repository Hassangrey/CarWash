import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);
  static const String id = '/OrderHistoryScreen';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        child: Container(
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.grey[100],
            ),
            margin: EdgeInsets.only(
              bottom: 10,
            ),
            child: InkWell(
              onTap: () => {BottomSheet(context)},
              child: Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/9/94/KFUPM_seal.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 170.w,
                    child: Text('Order ${index + 1}'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Column(
                      children: [
                        Text(
                          'Price: 30SR',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        Text('24/11/2022',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 10.sp)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    ));
  }

  Future<dynamic> BottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/9/94/KFUPM_seal.png',
                    width: 50.w,
                    height: 50.h,
                    alignment: Alignment.center,
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Order No.',
                      textAlign: TextAlign.center,
                    )),
                Container(
                  height: 400.h,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.grey[200],
                          ),
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 50.w,
                                height: 50.h,
                                margin: EdgeInsets.all(5),
                                child: Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/9/94/KFUPM_seal.png',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                width: 170.w,
                                child: Text('Item ${index + 1}'),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Column(
                                  children: [
                                    Text(
                                      'Price: 10SR',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Text('Pieces: 2',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 10.sp)),
                                  ],
                                ),
                              )
                            ],
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
