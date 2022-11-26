import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Models/order_address.dart';
import 'package:safacw/providers/driver_provider.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:safacw/screens/3rd_screen.dart';

import 'bottom_navigation_bar_holder.dart';

Future<void> getLatAndLong() async {}

class acceptedOrder extends StatefulWidget {
  const acceptedOrder({Key? key}) : super(key: key);
  static const String id = '/acceptedOrder';

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _acceptedOrder();
  }
}

@override
class _acceptedOrder extends State<acceptedOrder> {
  // Map<PolylineId, Polyline> polylines = {};
  // List<LatLng> polylineCoordinates = [];
  // PolylinePoints polylinePoints = PolylinePoints();
  // String googleAPiKey = "AIzaSyBjIbO6t2nbfrlCucwKc7MR8U0loLx1Z8I";
  Timer? timer;
  late StreamSubscription<Position> ps;
  Completer<GoogleMapController> _controller = Completer();
  bool closeToCustomer = false;
  bool closeToLaundry = false;
  var cl;
  var lat, long;
  var _kGooglePlex;
  var latitudeCustomer = 26.4207;
  var longitudeCustomer = 50.0888;
  var latitudeLaundry = 26.4207;
  var longitudeLaundry = 50.087822;

  updateOrder(OrderAddress orderAddress) async {
    var orders = await Provider.of<DriverProvider>(context, listen: false)
        .updateOrderAddress(orderAddress);
    print(orders);
  }

  getStreaming() {
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 15.4746,
    );
    // marker.remove(Marker(markerId: MarkerId('you')));
    setState(() {});
    // marker.add(Marker(
    //     markerId: MarkerId('you'),
    //     position: LatLng(lat, log),
    //     infoWindow: InfoWindow(title: 'you')));
  }

  // static final CameraPosition CustomerLocation = CameraPosition(
  //     target: LatLng(latitudeCustomer, longitudeCustomer),
  //     tilt: 59.44071697143555,
  //     zoom: 15.151926040649414);

  // static final CameraPosition laundryLocation = CameraPosition(
  //     target: LatLng(26.4207, 50.087822),
  //     tilt: 59.440717697143555,
  //     zoom: 15.151926040649414);
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
  };

  void initState() {
    // TODO: implement initState
    super.initState();
    // getPostion();

    ps = Geolocator.getPositionStream().listen((Position position) {
      lat = position.latitude;
      long = position.longitude;
      if (Geolocator.distanceBetween(position.latitude, position.longitude,
              latitudeCustomer, longitudeCustomer) <
          40) {
        print(
            'object=====================================================================');
        closeToCustomer = true;
        setState(() {});
      } else {
        print('False');
      }
      if (Geolocator.distanceBetween(position.latitude, position.longitude,
                  latitudeLaundry, longitudeLaundry) <
              40 &&
          closeToCustomer) {
        closeToLaundry = true;
        closeToCustomer = false;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          title: 'Location Services',
          btnOkOnPress: () {
            Navigator.pushNamedAndRemoveUntil(
                context, NavBarHolder.id, ModalRoute.withName('/'));
          },
          btnOkColor: Colors.lightBlue,
          body: Text('Good job!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
        )..show().then((value) => ps.cancel());
      }

      getStreaming();
      if (mounted) {
        timer = Timer.periodic(Duration(seconds: 3),
            (Timer t) => updateOrder(OrderAddress(long: long, latt: lat)));
      }
    });
    // _getPolyline();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return PageLayout(
      child: _kGooglePlex == null
          ? Center(
              child: Container(
                  height: 50.h,
                  width: 50.w,
                  child: CircularProgressIndicator()),
            )
          : Wrap(children: [
              Stack(
                children: [
                  Container(
                    height: 500.h,
                    width: 400.w,
                    child: GoogleMap(
                        // polylines: Set<Polyline>.of(polylines.values),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        markers: marker,
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (controller) {
                          if (!_controller.isCompleted) {
                            //first calling is false
                            //call "completer()"
                            _controller.complete(controller);
                          } else {
                            //other calling, later is true,
                            //don't call again completer()

                          }
                        }),
                  ),
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: FloatingActionButton.extended(
                        heroTag: "home",
                        onPressed: _goToCustomer,
                        label: Icon(Icons.home),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    left: 80.h,
                    child: Container(
                      child: FloatingActionButton.extended(
                        heroTag: "laundry",
                        onPressed: _goTolaundry,
                        label: Icon(Icons.local_laundry_service),
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      child: FloatingActionButton.extended(
                        heroTag: "myLocation",
                        onPressed: _currentLocation,
                        label: Icon(Icons.location_on_outlined),
                      ),
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),

              closeToCustomer == false
                  ? Container(
                      margin: EdgeInsets.only(top: 20.h),
                      child: Wrap(
                        children: [
                          Container(
                            width: 150.w,
                            margin: EdgeInsets.all(6),
                            child: ElevatedButton(
                              onPressed: () {
                                _goToCustomerOnGoogle();
                              },
                              child: Center(child: Text('Go to customer')),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.w, top: 25.h),
                            child: Text(
                              'Go to the customer first',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 20.h),
                      child: Wrap(
                        children: [
                          Container(
                            width: 150.w,
                            margin: EdgeInsets.all(6),
                            child: ElevatedButton(
                              onPressed: () {
                                _goToLaundryOnGoogle();
                              },
                              child: Center(child: Text('Go to laundry')),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.w, top: 25.h),
                            child: Text(
                              'Go to the laundry second',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ))

              // :  Container(
              // width: 50.w,
              // height: 40.h,
              // margin: EdgeInsets.only(left: 110.w, top: 12.h),
              // decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 90, 205, 94),
              //     border: Border.all(color: Colors.white),
              //     borderRadius: BorderRadius.circular(40.r)),
              // child: Center(
              //   child: IconButton(
              //     onPressed: () {
              //       _goToLaundryOnGoogle();
              //     },
              //     icon: Icon(
              //       Icons.done,
              //       color: Colors.white,
              //     ),
              //   ),
              // ))
            ]),
    );
  }

  Future<void> _goToCustomer() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(latitudeCustomer, longitudeCustomer),
        tilt: 59.44071697143555,
        zoom: 15.151926040649414)));
    print(Geolocator.distanceBetween(
        lat, long, latitudeCustomer, longitudeCustomer));
  }

  Future<void> _goTolaundry() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(latitudeLaundry, longitudeLaundry),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414)));
  }

  Future<void> _goToCustomerOnGoogle() async {
    MapsLauncher.launchCoordinates(latitudeCustomer, longitudeCustomer);
    // var lat1 = latitudeCustomer.toString();
    // var long1 = longitudeCustomer.toString();
    // var x = '/?api=1&query=$lat1,$long1';
    // String googleUrl = 'https://www.google.com/maps/search${x.toString()}';
    // if (await canLaunch(googleUrl)) {
    //   await launch(googleUrl);
    // } else {
    //   throw 'Could not open the map.';
    // }
  }

  Future<void> _goToLaundryOnGoogle() async {
    MapsLauncher.launchCoordinates(latitudeLaundry, longitudeLaundry);
    // var lat1 = latitudeCustomer.toString();
    // var long1 = longitudeCustomer.toString();
    // var x = '/?api=1&query=$lat1,$long1';
    // String googleUrl = 'https://www.google.com/maps/search${x.toString()}';
    // if (await canLaunch(googleUrl)) {
    //   await launch(googleUrl);
    // } else {
    //   throw 'Could not open the map.';
    // }
  }

  Future<void> _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, long),
        tilt: 59.44071697143555,
        zoom: 15.151926040649414)));
  }
  // _addPolyLine() {
  //   PolylineId id = PolylineId("poly");
  //   Polyline polyline = Polyline(
  //       polylineId: id, color: Colors.blue, points: polylineCoordinates);
  //   polylines[id] = polyline;
  //   setState(() {});
  // }

  // _getPolyline() async {
  //   print(
  //       '+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+__+_+_+_+_+_+_+_+_+__+_+_+_+_+_+_+_+_+_+_+__+_+_+_+_+_+_+_+_+_+_+_+_$lat');
  //   print(
  //       '+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+__+_+_+_+_+_+_+_+_+__+_+_+_+_+_+_+_+_+_+_+__+_+_+_+_+_+_+_+_+_+_+_+_$long');
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       googleAPiKey,
  //       PointLatLng(26.4207, 50.087822),
  //       PointLatLng(26.4207, 50.0888),
  //       travelMode: TravelMode.driving,
  //       wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
  //   // if (result.points.isNotEmpty) {
  //   //   result.points.forEach((PointLatLng point) {
  //   polylineCoordinates.add(LatLng(26.4207, 50.087822));
  //   polylineCoordinates.add(LatLng(26.4207, 50.0888));
  //   //   });
  //   // }
  //   _addPolyLine();
  // }
}
