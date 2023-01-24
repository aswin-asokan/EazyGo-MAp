import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.999546, 76.307841),
    zoom: 14.4746,
  );

  late GoogleMapController mapController;
  late String search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          onMapCreated: onMapCreated,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
        ),
        Positioned(
            top: 30.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter Location",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                    )),
                onChanged: (value) {
                  search = value;
                },
              ),
            ))
      ]),
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Color.fromRGBO(28, 103, 88, 1),
      ),
    );
    ;
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
