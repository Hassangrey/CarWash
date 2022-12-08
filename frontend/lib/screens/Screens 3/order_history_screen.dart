import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/Constants/addspace_functions.dart';
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

  changeid(index) async {
    var orders = await Provider.of<CarWashProvider>(context, listen: false)
        .getOrder0(index);
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
            ? const Center(child: CircularProgressIndicator())
            : Container(
                child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.grey[100],
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: InkWell(
                        onTap: () async {
                          changeid(orders[index].id);
                          BottomSheet(context, index);
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              margin: const EdgeInsets.all(5),
                              child: Image.network(
                                '${orders[index].service_provider.profile.imgPath}',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              width: 170.w,
                              child: Text('Order #${index + 1}'),
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
    dynamic order = Provider.of<CarWashProvider>(context, listen: false)
        .ordersHistory[index];
    List<Item> items = orders[index].items;

    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Wrap(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(5),
                  child: Image.network(
                    '${orders[index].service_provider.profile.imgPath}',
                    width: 50.w,
                    height: 50.h,
                    alignment: Alignment.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    order.status.toString() == "ACCEPTED" &&
                            provider.type == 'Laundry'
                        ? TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, TrackDriverScreen.id);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: COLOR_BLUE_LIGHT,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text(
                                '🚘 Track Driver',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: COLOR_BLUE_DARK,
                                ),
                              ),
                            ))
                        : const SizedBox.shrink(),
                    Text('${order.status.toString()}',
                        textAlign: TextAlign.center,
                        style: order.status.toString() == "INITIAL"
                            ? TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.orange,
                                color: Colors.white)
                            : order.status.toString() == "PENDING"
                                ? TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.amber[600],
                                    color: Colors.white)
                                : TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.green[600],
                                    color: Colors.white)),
                  ],
                ),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
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
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.grey[200],
                          ),
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 50.w,
                                height: 50.h,
                                margin: const EdgeInsets.all(5),
                                child: Image.network(
                                  '${items[index].imgPath}',
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 15),
                                width: 170.w,
                                child: Text(
                                  '${items[index].title}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Column(
                                  children: [
                                    Text(
                                      'Price: ${items[index].price}SR',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: COLOR_BLUE_DARK,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text('Pieces: ${items.length.toString()}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: COLOR_BLUE_DARK,
                                        )),
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
