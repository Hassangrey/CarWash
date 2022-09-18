import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

Completer<GoogleMapController> _controller = Completer();

class orderDetails extends StatefulWidget {
  const orderDetails({Key? key}) : super(key: key);
  static const String id = '/orderDetails';

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _orderDetails();
  }
}
// Widget build(BuildContext context) {
//   Future<void> getPostion() async {
//     bool services;

//     getLatAndLong();
//     cl = await Geolocator.getCurrentPosition().then((value) => value);
//     print(cl);

//     lat = cl.latitude;
//     long = cl.longitude;
//     print(lat);
//     print(long);

//     _kGooglePlex = CameraPosition(
//       target: LatLng(lat, long),
//       zoom: 14.4746,
//     );
//   }

//   return PageLayout(
//     child: Wrap(children: [
//       _kGooglePlex == null
//           ? CircularProgressIndicator()
//           : Container(
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(40)),
//               height: 400,
//               width: 400,
//               child: GoogleMap(
//                 mapType: MapType.normal,
//                 initialCameraPosition: _kGooglePlex,
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller.complete(controller);
//                 },
//               ),
//             ),
//       InkWell(
//         onTap: () => getPostion(),
//         child: Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 borderRadius: BorderRadius.circular(40)),
//             height: 50,
//             child: Center(child: Text('Order 1'))),
//       ),
//     ]),
//   );
// }

@override
class _orderDetails extends State<orderDetails> {
  var cl;
  var lat, long;
  var _kGooglePlex;
  Future<void> getPostion() async {
    print(cl);
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    LocationPermission per;

    per = await Geolocator.checkPermission();
    print(per);

    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print('=============================================');
      per = await Geolocator.requestPermission();
    }
    if (!services) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Location Services',
        body: Text(
            'Location services is not enabled, please enable it to proceed'),
        btnOkOnPress: () {},
      )..show();
    } else {
      cl = await Geolocator.getCurrentPosition().then((value) => value);
      lat = cl.latitude;
      long = cl.longitude;
      print(lat);
      print(long);

      _kGooglePlex = CameraPosition(
        target: LatLng(lat, long),
        zoom: 15.4746,
      );

      setState(() {});
      print(
          '=============================================${_kGooglePlex.target}');
    }
  }

  void getCustomerPostion() {
    print(
        '=============================================${_kGooglePlex.target}');

    // setState(() {
    //   _kGooglePlex = CameraPosition(
    //     target: LatLng(26.4207, 50.0888),
    //     zoom: 20.4746,
    //   );
    // });
  }

  static final CameraPosition CustomerLocation = CameraPosition(
      target: LatLng(26.4207, 50.0888),
      tilt: 59.440717697143555,
      zoom: 15.151926040649414);

  static final CameraPosition laundryLocation = CameraPosition(
      target: LatLng(26.4207, 50.087822),
      tilt: 59.440717697143555,
      zoom: 15.151926040649414);
  Set<Marker> marker = {
    Marker(
        markerId: MarkerId('customer'),
        position: LatLng(26.4207, 50.0888),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(title: 'customer')),
    Marker(
        markerId: MarkerId('laundry'),
        position: LatLng(26.4207, 50.087822),
        infoWindow: InfoWindow(title: 'laundry')),
    // Marker(
    //     markerId: MarkerId('you'),
    //     position: LatLng(lat, long),
    //     infoWindow: InfoWindow(title: 'you'))
  };

  getStreaming(lat, log) {
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, log),
      zoom: 15.4746,
    );
    marker.remove(Marker(markerId: MarkerId('you')));
    setState(() {});
    marker.add(Marker(
        markerId: MarkerId('you'),
        position: LatLng(lat, log),
        infoWindow: InfoWindow(title: 'you')));
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getPostion();
    StreamSubscription<Position> ps =
        Geolocator.getPositionStream().listen((Position position) {
      getStreaming(position.latitude, position.longitude);
    });
  }

  Widget build(BuildContext context) {
    return PageLayout(
      child: Stack(
        children: [
          _kGooglePlex == null
              ? CircularProgressIndicator()
              : Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40.r)),
                  height: 450.h,
                  width: 400.w,
                  child: GoogleMap(
                    markers: marker,
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
          Positioned.fill(
            top: 330.h,
            child: Container(
              alignment: Alignment.topRight,
              child: FloatingActionButton.extended(
                heroTag: "Customerhome",
                onPressed: _goToCustomer,
                label: Icon(Icons.home),
              ),
            ),
          ),

          Positioned.fill(
            top: 390.h,
            child: Container(
              child: FloatingActionButton.extended(
                heroTag: "Laundry",
                onPressed: _goTolaundry,
                label: Icon(Icons.local_laundry_service),
              ),
              alignment: Alignment.topRight,
            ),
          )

          // InkWell(
          //   onTap: () {
          //     getCustomerPostion();
          //   },
          //   child: Container(
          //       decoration: BoxDecoration(
          //           border: Border.all(color: Colors.black),
          //           borderRadius: BorderRadius.circular(40)),
          //       height: 50,
          //       child: Center(child: Text('Order 1'))),
          // ),
          // InkWell(
          //   onTap: () async {
          //     getPostion();
          //   },
          //   child: Container(
          //       decoration: BoxDecoration(
          //           border: Border.all(color: Colors.black),
          //           borderRadius: BorderRadius.circular(40)),
          //       height: 50,
          //       child: Center(child: Text('Order 1'))),
          // ),
        ],
      ),
    );
  }

  Future<void> _goToCustomer() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CustomerLocation));
  }

  Future<void> _goTolaundry() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(laundryLocation));
  }
}

// Future getPostion() async {
//   bool services;
//   services = await Geolocator.isLocationServiceEnabled();
//   LocationPermission per;

//   per = await Geolocator.checkPermission();
//   print(per);

//   if (per == LocationPermission.denied ||
//       per == LocationPermission.deniedForever) {
//     print('=============================================');
//     per = await Geolocator.requestPermission();
//   }
//   if (!services) {
//     AwesomeDialog(
//       context: context,
//       dialogType: DialogType.error,
//       animType: AnimType.rightSlide,
//       title: 'Location Services',
//       body: Text(
//           'Location services is not enabled, please enable it to proceed'),
//       btnOkOnPress: () {},
//     )..show();
//   } else {
//     getLatAndLong();
//     print(cl);
//   }
// }

