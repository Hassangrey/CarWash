import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/addspace_functions.dart';
import 'package:safacw/screens/Screens%203/empty_cart_screen.dart';
import 'package:safacw/screens/Screens%203/location_map_screen.dart';
import 'package:safacw/screens/Screens%203/order_done.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/widgets/snackbar_widget.dart';

import '../../providers/carwash_provider.dart';

// TODO 3: Make Cart page the contains a title, the laundry info (Name, photo, location)
// * Display list of items the user added in
// * A buttom to increment or decrement each item
// * Display the total price for all the items
class CartScreen extends StatelessWidget {
  static const String id = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CarWashProvider>(context);

    return PageLayout(
      child: provider.cartItems.isEmpty
          ? const EmptyCartScreen()
          : MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(primary: true, children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Order Total',
                    style: kServiceTitleStyle.copyWith(
                        fontSize: 18, color: Colors.black),
                  ),
                ),
                addVerticalSpace(8.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'SAR' + provider.getTotal(),
                    style: kServiceTitleStyle,
                  ),
                ),
                addVerticalSpace(12.h),
                OrderTotalInfoHolder(
                  title: 'Order Amount',
                  total: 'SAR' + provider.total.toString(),
                ),
                OrderTotalInfoHolder(
                  title: 'Tax 15%',
                  total: 'SAR' + provider.getTaxes(),
                ),
                OrderTotalInfoHolder(
                  title: 'Delivery Amount',
                  total: 'SAR12',
                ),
                addVerticalSpace(4.h),
                Divider(thickness: 2),
                addVerticalSpace(4.h),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: provider.cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (Container(
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: COLOR_GREY.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                  provider.cartItems[index].imgPath!),
                            ),
                            title: Text(
                              provider.cartItems[index].title!,
                              style: kCarItemNameStyle,
                            ),
                            subtitle: Text(
                              'SAR' +
                                  provider.cartItems[index].price.toString(),
                              style: kCarItemPriceStyle,
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                provider
                                    .removeItem(provider.cartItems[index].id!);
                              },
                            )),
                      ));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return addVerticalSpace(10.h);
                    },
                  ),
                ),
                addVerticalSpace(20.h),
                GetMyLocationWidget(),
                addVerticalSpace(20.h),
                MyCustomButton(
                  title: 'Place Order',
                  onPressed: () {
                    if (provider.address == '')
                      showActionSnackBar(
                          context, 'Please confirm your address');
                    else
                      Navigator.pushNamed(context, OrderDoneScreen.id);
                  },
                )
              ]),
            ),
    );
  }
}

class OrderTotalInfoHolder extends StatelessWidget {
  final String title;
  final String total;
  const OrderTotalInfoHolder({
    Key? key,
    required this.title,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(2),
      color: COLOR_GREY.withOpacity(0.15),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15.sp),
          ),
          Text(
            total,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class GetMyLocationWidget extends StatelessWidget {
  const GetMyLocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, MapScreen.id),
      child: Container(
        width: 300.w,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          border: Border.all(width: 3.5, color: COLOR_BLUE_LIGHT),
          borderRadius: BorderRadius.circular(25.r),
          color: COLOR_GREY.withOpacity(0.4),
        ),
        alignment: Alignment.center,
        child: Text(
          'Get my location',
          style: kTitleStyle.copyWith(color: COLOR_BLUE_DARK),
        ),
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final void Function()? onPressed;

  const MyCustomButton({
    Key? key,
    required this.title,
    this.color = COLOR_BLUE_DARK,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          )),
    );
  }
}
