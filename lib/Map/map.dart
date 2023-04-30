import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  List<Marker> myMarker = [];
  List<Marker> markers = [];

  @override
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.999546, 76.307841),
    zoom: 16,
  );

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late GoogleMapController mapController;

  late Position currentposition;
  var geoLocator = Geolocator();

  /*icon 
  specified
  here*/
  BitmapDescriptor icon =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
  BitmapDescriptor iconH =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
  BitmapDescriptor iconM =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
  BitmapDescriptor iconL =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
  BitmapDescriptor iconP =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
  BitmapDescriptor iconO =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
      

  /*current
  location
  function 
  here*/
  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentposition = position;
    LatLng latlngposition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latlngposition, zoom: 16);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
  /*firestore
  connection*/

  bool isVisible = false;
  String? _chosenValue1 = 'Road Issues';
  String? _chosenValue2 = 'High Risk';
  String? cVal1, cVal2, Des;
  int? i;

  Future<void> addMarker(double lat, double lng, String title) async {
    await _firestore.collection('markers').add({
      'latitude': lat,
      'longitude': lng,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    var h = height * 0.35;
    //Font size
    var font1 = height * 0.03;
    var font2 = height * 0.02;
    var font3 = width * 0.046;
    TextEditingController issue_tf = TextEditingController();
    String issue = '';
    _handleTap(LatLng tappedPoint) {
      void _addMarker() {
        setState(() {
          issue = issue_tf.text;
          var newMarker = myMarker.add(Marker(
            infoWindow: InfoWindow(
              title: _chosenValue1,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                          title: Text('$cVal1'),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Column(
                                    children: [
                                      if (cVal1 == 'Road Issues')
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Severity: $cVal2',
                                            style: GoogleFonts.urbanist(
                                              fontSize: font1,
                                            ),
                                          ),
                                        ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Description :\n$Des',
                                              style: GoogleFonts.urbanist(
                                                fontSize: font1,
                                              ))),
                                      TextButton(
                                          onPressed: () {}, child: Text('Ok'))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      });
                    });
              },
            ),
            markerId: MarkerId('${myMarker.length}'),
            position: tappedPoint,
            draggable: true,
            icon: icon,
          ));
        });
        addMarker(
            tappedPoint.latitude, tappedPoint.longitude, issue.toString());
      }

      void _changeVal() {
        setState(() {
          cVal1 = _chosenValue1;
          cVal2 = _chosenValue2;
          if (issue.isNotEmpty) {
            Des = issue;
          } else {
            Des = 'No description on the issue';
          }

          _chosenValue1 = 'Road Issues';
          _chosenValue2 = 'High Risk';
          icon = iconH;
        });
      }

      showDialog(
          context: context,
          builder: (context) {
            final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
            int n;
            if (isKeyboard) {
              n = 9;
            } else {
              n = 4;
            }
            bool testBool = true;
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: Text('Make Report',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.urbanist(
                          color: Color(0xff1c6758),
                          fontWeight: FontWeight.w600,
                          fontSize: font1)),
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
                                  fontSize: font2)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          child: Text('OK',
                              style: GoogleFonts.urbanist(
                                  color: Color(0xff1c6758),
                                  fontWeight: FontWeight.w500,
                                  fontSize: font2)),
                          onPressed: () {
                            _addMarker();
                            Navigator.of(context).pop();
                            _changeVal();
                          },
                        ),
                      ],
                    ),
                  ],
                  content: Container(
                    height: h,
                    child: Column(
                      children: [
                        if (!isKeyboard)
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Select Issue:',
                                  style: GoogleFonts.urbanist(
                                    fontSize: font3,
                                  ))),
                        if (!isKeyboard)
                          Row(
                            children: [
                              Icon(Icons.info_outline_rounded),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Container(
                                width: width * 0.53,
                                child: DropdownButton(
                                  style: GoogleFonts.urbanist(
                                      fontSize: font3, color: Colors.black),
                                  dropdownColor:
                                      Color.fromRGBO(217, 233, 230, 1),
                                  value: _chosenValue1,
                                  items: <String>[
                                    'Road Issues',
                                    'Pipe Leakage',
                                    'Other Issues',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _chosenValue1 = value;
                                      if (_chosenValue1 == 'Road Issues') {
                                        icon = iconH;
                                        h = height * 0.35;
                                      } else if (_chosenValue1 ==
                                          'Pipe Leakage') {
                                        icon = iconP;
                                        h = height * 0.25;
                                      } else if (_chosenValue1 ==
                                          'Other Issues') {
                                        icon = iconO;
                                        h = height * 0.25;
                                      } else {
                                        icon = iconH;
                                      }
                                    });
                                  },
                                  icon: Icon(null),
                                ),
                              ),
                            ],
                          ),
                        if (!isKeyboard)
                          SizedBox(
                            height: width * 0.03,
                          ),
                        if (_chosenValue1 == 'Road Issues' && !isKeyboard)
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Select Severity:')),
                        if (_chosenValue1 == 'Road Issues' && !isKeyboard)
                          Row(
                            children: [
                              Icon(Icons.warning_amber_outlined),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Container(
                                width: width * 0.53,
                                child: DropdownButton(
                                  style: GoogleFonts.urbanist(
                                      fontSize: font3, color: Colors.black),
                                  icon: Icon(null),
                                  dropdownColor:
                                      Color.fromRGBO(217, 233, 230, 1),
                                  value: _chosenValue2,
                                  items: <String>[
                                    'High Risk',
                                    'Medium Risk',
                                    'Low Risk',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _chosenValue2 = value;
                                      if (_chosenValue1 == 'Road Issues') {
                                        if (_chosenValue2 == 'High Risk') {
                                          icon = iconH;
                                        } else if (_chosenValue2 ==
                                            'Medium Risk') {
                                          icon = iconM;
                                        } else {
                                          icon = iconL;
                                        }
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        if (_chosenValue1 == 'Road Issues')
                          SizedBox(
                            height: width * 0.03,
                          ),
                        TextField(
                          controller: issue_tf,
                          keyboardType: TextInputType.multiline,
                          maxLines: n,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter description on the issue'),
                        )
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
      locatePosition();
    });
  }
}
