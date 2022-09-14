import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:safacw/widgets/page_layout.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Completer<GoogleMapController> _controller = Completer();

final CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

class orderDetails extends StatelessWidget {
  const orderDetails({Key? key}) : super(key: key);
  static const String id = '/orderDetails';
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Wrap(children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          height: 400,
          width: 400,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ]),
    );
  }
}
