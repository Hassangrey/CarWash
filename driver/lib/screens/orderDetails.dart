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
import 'package:safacw/screens/3rd_screen.dart';

import 'bottom_navigation_bar_holder.dart';

Future<void> getLatAndLong() async {}

class orderDetails extends StatefulWidget {
  const orderDetails({Key? key}) : super(key: key);
  static const String id = '/orderDetails';

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _orderDetails();
  }
}

@override
class _orderDetails extends State<orderDetails> {
  late StreamSubscription<Position> ps;
  Completer<GoogleMapController> _controller = Completer();
  var cl;
  var lat, long;
  var _kGooglePlex;

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

  static final CameraPosition CustomerLocation = CameraPosition(
      target: LatLng(26.4207, 50.0888),
      tilt: 59.44071697143555,
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
  };

  void initState() {
    // TODO: implement initState
    super.initState();
    // getPostion();

    ps = Geolocator.getPositionStream().listen((Position position) {
      lat = position.latitude;
      long = position.longitude;
      getStreaming();
    });
  }

  Widget build(BuildContext context) {
    return _kGooglePlex == null
        ? Center(
            child: Container(
                height: 50.h, width: 50.w, child: CircularProgressIndicator()),
          )
        : PageLayout(
            child: Wrap(children: [
              Stack(
                children: [
                  Container(
                    height: 500.h,
                    width: 400.w,
                    child: GoogleMap(
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
                    top: 5.h,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: FloatingActionButton.extended(
                        heroTag: "home",
                        onPressed: _goToCustomer,
                        label: Icon(Icons.home),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 65.h,
                    child: Container(
                      child: FloatingActionButton.extended(
                        heroTag: "laundry",
                        onPressed: _goTolaundry,
                        label: Icon(Icons.local_laundry_service),
                      ),
                      alignment: Alignment.topRight,
                    ),
                  ),
                  Positioned.fill(
                    top: 440.h,
                    child: Container(
                      child: FloatingActionButton.extended(
                        heroTag: "myLocation",
                        onPressed: _currentLocation,
                        label: Icon(Icons.location_on_outlined),
                      ),
                      alignment: Alignment.topRight,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: ElevatedButton(
                  onPressed: () {
                    ps.cancel();
                    Navigator.pushNamed(context, NavBarHolder.id);
                  },
                  child: Center(child: Text('Go Back!')),
                ),
              )
            ]),
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

  Future<void> _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, long),
        tilt: 59.44071697143555,
        zoom: 15.151926040649414)));
  }
}
