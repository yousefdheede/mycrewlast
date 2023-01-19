import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mymap extends StatefulWidget {
  const mymap({super.key});

  @override
  State<mymap> createState() => _MyAppState();
}

class _MyAppState extends State<mymap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_pin),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    zoom: 20, target: LatLng(31.51114848, 32.54484844))));
          },
        ),
        appBar: AppBar(
          title: const Text('MYCREW'),
          backgroundColor: Colors.blue[700],
        ),
        body: GoogleMap(
          zoomControlsEnabled: false,
          markers: markers,
          onTap: (LatLng x) {
            log(x.toString());
            // markers.add(Marker(
            //   markerId: MarkerId('jerusalem+${x.latitude}'), position: x));
            //setState(() {});
          },
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(31.768319, 35.213710),
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
