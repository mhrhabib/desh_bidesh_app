import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryMap extends StatefulWidget {
  String countryName;
  List latlang;
  CountryMap({Key? key, required this.countryName, required this.latlang})
      : super(key: key);

  @override
  _CountryMapState createState() => _CountryMapState();
}

class _CountryMapState extends State<CountryMap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latlang[0], widget.latlang[1]),
          zoom: 7,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
