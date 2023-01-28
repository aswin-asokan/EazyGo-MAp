import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_fonts/google_fonts.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  /*static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.999546, 76.307841),
    zoom: 14.4746,
  );

  late GoogleMapController mapController;
  late String search;*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FlutterMap(
        options: MapOptions(center: LatLng(9.999546, 76.307841)),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          )
        ],
      ),
      Positioned(
        child: Container(
            height: 210,
            color: Color.fromRGBO(217, 233, 230, 1),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Map",
                            style: GoogleFonts.urbanist(
                                color: Color.fromRGBO(28, 103, 88, 1),
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      style: GoogleFonts.urbanist(
                          color: Color.fromRGBO(28, 103, 88, 1), fontSize: 20),
                      cursorColor: Color.fromRGBO(28, 103, 88, 1),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(28, 103, 88, 1))),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(28, 103, 88, 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(28, 103, 88, 1)))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 100,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  "Patches",
                                  style: GoogleFonts.urbanist(
                                      fontSize: 15,
                                      color: Color.fromRGBO(28, 103, 88, 1)),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Color.fromRGBO(28, 103, 88, 1))),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  "Leakage",
                                  style: GoogleFonts.urbanist(
                                      fontSize: 15,
                                      color: Color.fromRGBO(28, 103, 88, 1)),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Color.fromRGBO(28, 103, 88, 1))),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 100,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  "Lights",
                                  style: GoogleFonts.urbanist(
                                      fontSize: 15,
                                      color: Color.fromRGBO(28, 103, 88, 1)),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Color.fromRGBO(28, 103, 88, 1))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ) /*Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
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
        ),
      )*/

      /*GoogleMap(
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
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
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
          ))*/
    ]));
    ;
  }

  /*void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }*/
}
