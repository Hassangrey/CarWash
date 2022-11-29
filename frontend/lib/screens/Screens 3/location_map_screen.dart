import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/screens/Screens%203/cart_screen.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'MapScreen';

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late StreamSubscription<Position> ps;
  Completer<GoogleMapController> _controller = Completer();
  var lat, long;
  var _kGooglePlex;
  var currentLocation;
  var address;
  var coordinates;
  late Placemark place;

  Future<void> getCurrentPosition() async {
    currentLocation =
        await Geolocator.getCurrentPosition().then((value) => value);
    lat = currentLocation.latitude;
    long = currentLocation.longitude;
    /////////////////////////////////////////////
    await placemarkFromCoordinates(lat, long)
        .then((List<Placemark> placemarks) {
      place = placemarks[0];
      setState(() {
        address =
            "${place.country}, ${place.locality}, ${place.street}, ${place.postalCode} ";
      });
    });

    // print('Your address' + address);
/////////////////////////////////////////////////
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 17.4746,
    );
    // marker.remove(Marker(markerId: MarkerId('you')));
    setState(() {});
    marker.add(Marker(
        draggable: true,
        onDragEnd: (value) {
          lat = value.latitude;
          long = value.longitude;
          placemarkFromCoordinates(lat, long)
              .then((List<Placemark> placemarks) {
            place = placemarks[0];
            setState(() {
              address =
                  "${place.country}, ${place.locality}, ${place.street}, ${place.postalCode} ";
            });
          });

          // print(address);
        },
        markerId: MarkerId('you'),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: 'you')));
  }

  Set<Marker> marker = {
    Marker(
        markerId: MarkerId('customer'),
        position: LatLng(0, 0),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(title: 'customer')),
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAccess();
    getCurrentPosition();
    // ps = Geolocator.getPositionStream().listen((Position position) {
    //   lat = position.latitude;
    //   long = position.longitude;
    //   getStreaming();
    // });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CarWashProvider>(context);
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
                      height: 400.h,
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
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("Your current address: ${address}"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: MyCustomButton(
                    title: "Confirm",
                    onPressed: () {
                      provider.address = address;
                      provider.getLocation(lat.toString(), long.toString());
                      Navigator.pop(context);
                    },
                  ),
                )
              ]));
  }

  Future<void> checkAccess() async {
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    LocationPermission per;

    per = await Geolocator.checkPermission();
    // print(per);
    // print(services);
    // if (!services) {}

    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }

    setState(() {});
  }

  Future<void> _currentLocation() async {
    await getCurrentPosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 17.951926040649414)));
  }
}
