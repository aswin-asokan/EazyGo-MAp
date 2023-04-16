import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  List<Marker> myMarker = [];
  List<Marker> markers = [];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.999546, 76.307841),
    zoom: 16,
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
        new CameraPosition(target: latlngposition, zoom: 16);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  bool isVisible = false;
  String? _chosenValue = 'Road Issues';
  String group = "Red";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    _handleTap(LatLng tappedPoint) {
      void _addMarker() {
        setState(() {
          myMarker.add(Marker(
              markerId: MarkerId('${myMarker.length}'),
              position: tappedPoint,
              draggable: true));
        });
      }

      showDialog(
          context: context,
          builder: (context) {
            bool testBool = true;
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: Text('Make Report',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.urbanist(
                          color: Color(0xff1c6758),
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.03)),
                  backgroundColor: Color.fromRGBO(217, 233, 230, 1),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel',
                              style: GoogleFonts.urbanist(
                                  color: Color(0xff1c6758),
                                  fontWeight: FontWeight.w500,
                                  fontSize: height * 0.02)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          child: Text('OK',
                              style: GoogleFonts.urbanist(
                                  color: Color(0xff1c6758),
                                  fontWeight: FontWeight.w500,
                                  fontSize: height * 0.02)),
                          onPressed: () {
                            _addMarker();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                  content: Container(
                    height: height * 0.3,
                    child: Column(
                      children: [
                        DropdownButton(
                          value: _chosenValue,
                          items: <String>[
                            'Road Issues',
                            'Pipe Leakage',
                            'No Traffic Light',
                            'Other Road related issues',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                        Radio(
                            value: "Red",
                            groupValue: group,
                            onChanged: (val) {
                              group = val.toString();
                            }),
                        Radio(
                            value: "Orange",
                            groupValue: group,
                            onChanged: (val) {
                              group = val.toString();
                            })
                      ],
                    ),
                  ),
                );
              },
            );
          });
    }

    return Scaffold(
        body: Stack(children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            padding: EdgeInsets.only(top: 250),
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            markers: Set.from(myMarker),
            onTap: _handleTap,
          ),
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
