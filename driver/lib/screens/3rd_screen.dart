import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Models/order_address.dart';
import 'package:safacw/providers/driver_provider.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/screens/orderDetails.dart';
import 'package:safacw/screens/settings_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:safacw/screens/acceptedOrder.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);
  static const String id = '/3rdScreen';

  State<StatefulWidget> createState() {
    return _ThirdScreen();
  }
}

class _ThirdScreen extends State<ThirdScreen> {
  int index = 1;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAccess();
    // getGradDay();
    getOrders();
  }

  getOrders() async {
    var orders = await Provider.of<DriverProvider>(context, listen: false)
        .getAllOrders();
    print(orders);
  }

  updateOrder(index) async {
    var orders = await Provider.of<DriverProvider>(context, listen: false)
        .updateOrder(index: index);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> orders =
        Provider.of<DriverProvider>(context, listen: false).orders;
    var provider = Provider.of<DriverProvider>(context);
    return PageLayout(
        child: provider.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
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
                      onTap: () {
                        provider.selectedOrder = index;
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
                            child: Text(
                                '${orders[index].service_provider.username}'),
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
                                Text('Distance: 0.3km',
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
              ));
  }

  Future<dynamic> BottomSheet(BuildContext context, index) {
    List<dynamic> orders =
        Provider.of<DriverProvider>(context, listen: false).orders;
    List<dynamic> items =
        Provider.of<DriverProvider>(context, listen: false).orders[index].items;

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
                      '${orders[index].service_provider.username}',
                      textAlign: TextAlign.center,
                    )),
                Container(
                  height: 400.h,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: orders[index].items.length,
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
                                  '${items[index].imgPath}',
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
                                      '${items[index].price}',
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
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        width: 185.w,
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.blue[300],
                          heroTag: "laundry",
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                orderDetails.id, ModalRoute.withName('/'));
                          },
                          label: Icon(Icons.location_on_outlined),
                        ),
                        alignment: Alignment.bottomLeft,
                      ),
                      Container(
                        width: 185.w,
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.green[400],
                          heroTag: "laundry",
                          onPressed: () {
                            updateOrder(index);
                            Navigator.pushNamedAndRemoveUntil(context,
                                acceptedOrder.id, ModalRoute.withName('/'));
                          },
                          label: Icon(Icons.done_outline_rounded),
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Future<void> checkAccess() async {
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    LocationPermission per;

    per = await Geolocator.checkPermission();
    print(per);
    print(services);
    if (!services) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.topSlide,
        title: 'Location Services',
        btnOkOnPress: () {},
        btnOkColor: Colors.lightBlue,
        body: Text(
            'Location services are not enabled, please enable it to proceed',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),
      )..show().then((value) {
          checkAccess();
        });
    }

    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.topSlide,
        title: 'Location Services',
        btnOkOnPress: () {},
        btnOkColor: Colors.lightBlue,
        body: Text(
          'please give the application access to your location!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )..show().then((value) {
          checkAccess();
        });
    }

    setState(() {});
  }

  Future<void> getGradDay() async {
    var date = await DateTime.utc(2023, DateTime.january, 3);
    var toGradDay = (-1) * DateTime.now().difference(date).inDays;

    print(toGradDay);
    if (toGradDay > 0) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        title: 'graduation day',
        btnOkOnPress: () {},
        btnOkColor: Colors.green,
        btnOkText: 'يا كريم',
        body: Text(
          'You will graduate after $toGradDay days!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )..show();
    }

    setState(() {});
  }
}
