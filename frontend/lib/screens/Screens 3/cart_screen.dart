import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/addspace_functions.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/carwash_provider.dart';

// TODO 3: Make Cart page the contains a title, the laundry info (Name, photo, location)
// * Display list of items the user added in
// * A buttom to increment or decrement each item
// * Display the total price for all the items
class CartScreen extends StatelessWidget {
  static const String id = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    var carProvider = Provider.of<CarWashProvider>(context);

    return PageLayout(
      child: Column(children: [
        Text('Your Cart', style: kServiceTitleStyle),
        addVerticalSpace(20.h),
 Column(
                children: [
                  SizedBox(
                    height: 400.h,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.separated(
                        itemCount: carProvider.carWashProvidersProfilers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return (Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: COLOR_GREY.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 68.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                          image: NetworkImage(carProvider
                                              .myItems[index].imgPath!),
                                        )),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          carProvider.cartItems[index].title!,
                                          style: kCarItemNameStyle,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'SAR' +
                                                  carProvider
                                                      .cartItems[index].price
                                                      .toString(),
                                              style: kCarItemPriceStyle,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  carProvider.removeItem(
                                                      carProvider
                                                          .cartItems[index]
                                                          .id!);
                                                  print(carProvider
                                                      .cartItems.length);
                                                },
                                                // ignore: prefer_const_constructors
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red
                                                      .withOpacity(0.4),
                                                  size: 18,
                                                ))
                                          ],
                                        ),
                                        Text(
                                            carProvider.cartItems[index].desc!),
                                      ],
                                    ),
                                  )
                                ]),
                          ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return addVerticalSpace(10.h);
                        },
                      ),
                    ),
                  ),
                  addVerticalSpace(100.h),
                  SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: COLOR_BLUE_DARK),
                          onPressed: () {},
                          child: Text(
                            'Place Order',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          )))
                ],
              )
      ]),
    );
  }
}
