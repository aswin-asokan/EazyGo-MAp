import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

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

  late Position currentposition;
  var geoLocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentposition = position;
    LatLng latlngposition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latlngposition, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            myLocationEnabled: true,
            padding: EdgeInsets.only(top: 250),
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
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
                              color: Color.fromRGBO(28, 103, 88, 1),
                              fontSize: 20),
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
                                          color:
                                              Color.fromRGBO(28, 103, 88, 1)),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: Color.fromRGBO(
                                                28, 103, 88, 1))),
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
                                          color:
                                              Color.fromRGBO(28, 103, 88, 1)),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: Color.fromRGBO(
                                                28, 103, 88, 1))),
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
                                          color:
                                              Color.fromRGBO(28, 103, 88, 1)),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: Color.fromRGBO(
                                                28, 103, 88, 1))),
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
          )
        ]),
        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromRGBO(217, 233, 230, 1),
          child: IconButton(
            onPressed: locatePosition,
            icon: Icon(
              Icons.location_on,
            ),
            color: Color.fromRGBO(28, 103, 88, 1),
          ),
        ));
    ;
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
      locatePosition();
    });
  }
}
