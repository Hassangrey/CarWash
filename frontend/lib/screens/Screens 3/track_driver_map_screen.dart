import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safacw/Constants/Constants.dart';
import 'package:safacw/providers/carwash_provider.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class TrackDriverScreen extends StatefulWidget {
  static const String id = '/trackdriver';

  const TrackDriverScreen({Key? key}) : super(key: key);

  @override
  State<TrackDriverScreen> createState() => _TrackDriverScreenState();
}

class _TrackDriverScreenState extends State<TrackDriverScreen> {
  late StreamSubscription<Position> ps;
  Completer<GoogleMapController> _controller = Completer();
  var lat, long;
  var currentLocation;
  var _kGooglePlex;
  Timer? timer;
  var longDriver = 50.1560452580452;
  var lattDriver = 26.30732385969362;

  getOrder() async {
    var provider = await Provider.of<CarWashProvider>(context, listen: false);
    // var selectedOrder = provider.ordersHistory[provider.selectedOrder!]
    print(provider.selectedOrder);

    provider.getOrder(provider.selectedOrder!);
    var order = provider.selectedOrder2!;
    // print(order);
    longDriver = double.parse(order.driver!.profile!.long!);
    lattDriver = double.parse(order.driver!.profile!.latt!);
    print("langandlott ${longDriver}:$lattDriver");

    setState(() {});
  }

  Future<void> getUserCurrentLocation() async {
    currentLocation =
        await Geolocator.getCurrentPosition().then((value) => value);
    lat = currentLocation.latitude;
    long = currentLocation.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 15.4746,
    );
    Marker customerMarker = Marker(
        draggable: false,
        markerId: MarkerId('You'),
        position: LatLng(lat, long),
        infoWindow: const InfoWindow(title: 'You'));
    _markers.add(customerMarker);
  }

  late BitmapDescriptor driverIconMarker;
  getDriverMarker() async {
    driverIconMarker = await (BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/images/car_location_icon.png'));
  }

  Future<void> getDriverLiveLocation(double x, double y) async {
    Marker driverMarker = Marker(
        draggable: false,
        icon: BitmapDescriptor.defaultMarkerWithHue(100),
        markerId: MarkerId('Driver'),
        position: LatLng(x, y),
        infoWindow: const InfoWindow(title: 'Driver'));
    _markers.add(driverMarker);
  }

  List<Marker> _markers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<CarWashProvider>(context, listen: false);

    checkAccess();
    getUserCurrentLocation();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      getOrder();
      getDriverLiveLocation(lattDriver, longDriver);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CarWashProvider>(context);
    return PageLayout(
        child: _kGooglePlex == null
            ? const Center(child: CircularProgressIndicator())
            : Wrap(children: [
                Stack(
                  children: [
                    Container(
                      height: 600.h,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55.r)),
                      child: GoogleMap(
                          myLocationEnabled: true,
                          myLocationButtonEnabled: false,
                          markers: Set<Marker>.of(_markers),
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (controller) {
                            if (!_controller.isCompleted) {
                              _controller.complete(controller);
                            } else {}
                          }),
                    ),
                    Positioned.fill(
                      right: 20,
                      bottom: 40,
                      child: Container(
                        child: FloatingActionButton.extended(
                          backgroundColor: COLOR_BLUE_LIGHT,
                          heroTag: "myLocation",
                          onPressed: _currentLocation,
                          label: const Icon(
                            Icons.location_on_outlined,
                            color: COLOR_BLUE_DARK,
                          ),
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ],
                ),
              ]));
  }

  Future<void> checkAccess() async {
    bool services = await Geolocator.isLocationServiceEnabled();
    LocationPermission per;
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
    setState(() {});
  }

  Future<void> _currentLocation() async {
    getCurrentPosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 16.951926040649414)));
  }
}
