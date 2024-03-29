import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:safacw/providers/driver_provider.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);
  static const String id = '/OrderHistoryScreen';

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getGradDay();
    getOrders();
    log("dddd");
  }

  getOrders() async {
    var orders = await Provider.of<DriverProvider>(context, listen: false)
        .getAllOrdersHistory();
    print(orders);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> orders =
        Provider.of<DriverProvider>(context, listen: false).ordersHistory;
    var provider = Provider.of<DriverProvider>(context);

    return PageLayout(
        child: provider.isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                width: double.infinity,
                child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  itemCount: orders.length,
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
                        onTap: () => {BottomSheet(context, index)},
                        child: Row(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              margin: EdgeInsets.all(5),
                              child: Image.network(
                                '${orders[index].service_provider.profile.imgPath}',
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
                                    'Price: ${orders[index].price}SR',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                  Text('${orders[index].date}',
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

  Future<dynamic> BottomSheet(BuildContext context, index) {
    List<dynamic> orders =
        Provider.of<DriverProvider>(context, listen: false).ordersHistory;
    List<dynamic> items = orders[index];

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
                    '${orders[index].ImgPath}',
                    width: 50.w,
                    height: 50.h,
                    alignment: Alignment.center,
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Order No. ${orders[index].id.toString()}',
                      textAlign: TextAlign.center,
                    )),
                Container(
                  height: 400.h,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
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
                                  '${items[index].ImgPath}',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                width: 170.w,
                                child: Text('${items[index].title}'),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Column(
                                  children: [
                                    Text(
                                      'Price: ${items[index].price}SR',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Text('Pieces: ${items.length}',
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
