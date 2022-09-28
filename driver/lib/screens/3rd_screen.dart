import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safacw/screens/orderDetails.dart';
import 'package:safacw/screens/settings_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);
  static const String id = '/3rdScreen';

  State<StatefulWidget> createState() {
    return _ThirdScreen();
  }
}

class _ThirdScreen extends State<ThirdScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAccess();
    getGradDay();
  }

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
            showModalBottomSheet(
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
