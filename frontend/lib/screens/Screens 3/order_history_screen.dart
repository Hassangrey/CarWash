import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Models/Item.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/screens/Screens%203/track_driver_map_screen.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO 4: Display a list that shows all the previous orders( Will be fetched from the API)
// * And their state (Completed, pending, or canceled)

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);
  static const String id = 'OrdersHistoryScreen';

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  getOrders() async {
    var orders = await Provider.of<CarWashProvider>(context, listen: false)
        .getAllOrdersHistory();
    print(orders);
  }

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> orders =
        Provider.of<CarWashProvider>(context, listen: false).ordersHistory;
    var provider = Provider.of<CarWashProvider>(context);

    return PageLayout(
        child: provider.isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
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
                        onTap: () async {
                          await provider.getOrder(index);

                          BottomSheet(context, index);
                        },
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
                                    'Price: ${orders[index].price}SR',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                  Text('${orders[index].price}',
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
    var provider = Provider.of<CarWashProvider>(context, listen: false);
    List<dynamic> orders =
        Provider.of<CarWashProvider>(context, listen: false).ordersHistory;
    List<Item> items = orders[index];
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
                TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await provider.getOrder(index);
                      Navigator.pushNamed(context, TrackDriverScreen.id);
                    },
                    child: Text('Go To Map')),
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
                                  'https://upload.wikimedia.org/wikipedia/commons/9/94/KFUPM_seal.png',
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
                                    Text('Pieces: ${items.length.toString()}',
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
