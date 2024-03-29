import 'package:eazygo_map/Profile/ContactUs.dart';
import 'package:eazygo_map/Profile/SourceScreen/Variables.dart';
import 'package:eazygo_map/Profile/profilePage.dart';
import 'package:eazygo_map/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  List<Marker> myMarker = [];
  List<Marker> markers = [];
  @override
  void initState() {
    super.initState();
    _getMarkersFromFirestore();
  }

  @override
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.999546, 76.307841),
    zoom: 16,
  );

  late GoogleMapController mapController;

  late Position currentposition;
  var geoLocator = Geolocator();
  Color color1 = Color.fromRGBO(217, 233, 230, 1);
  Color color2 = Color(0xff1c6758);

  void _getUsersFromFirestore() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('USERS')
        .where('provider', isEqualTo: provider)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        location = doc['Location'];
        print('loc:' + location!);
        userName = doc['Name'];
        img = doc['image'];
        provider = doc['provider'];
      }
    }
  }

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

  void showBottomSheet() {}
  String? icons;
  Future<void> _addMarkerToFirestore() async {
    String description;
    double hue;
    String color;
    if (issueTf.text.isEmpty) {
      description = 'No description';
    } else {
      description = issueTf.text;
    }
    if (_chosenValue1 == 'Poor Road Condition') {
      hue = 0.0;
      color = hue.toString();
    } else if (_chosenValue1 == 'Pipe Leakage') {
      hue = 210.0;
      color = hue.toString();
    } else if (_chosenValue1 == 'Traffic Signals not Working') {
      hue = 120.0;
      color = hue.toString();
    } else if (_chosenValue1 == 'Poor side walks') {
      hue = 60.0;
      color = hue.toString();
    } else if (_chosenValue1 == 'No zebra Crossing') {
      hue = 30.0;
      color = hue.toString();
    } else {
      hue = 270.0;
      color = hue.toString();
    }

    String? markerID = const Uuid().v4();
    await FirebaseFirestore.instance.collection('markers').add({
      'id': markerID,
      'provider': provider,
      'user': userName,
      'position': GeoPoint(currentposition.latitude, currentposition.longitude),
      'title': '$_chosenValue1',
      'description': description,
      'color': color,
      'visible': true
    });
    await FirebaseFirestore.instance.collection('markersAuth').add({
      'id': markerID,
      'provider': provider,
      'user': userName,
      'position': GeoPoint(currentposition.latitude, currentposition.longitude),
      'title': '$_chosenValue1',
      'description': description,
      'color': color,
      'visible': true
    });
    setState(() {});
  }

  void _getMarkersFromFirestore() {
    FirebaseFirestore.instance
        .collection('markers')
        .snapshots()
        .listen((querySnapshot) {
      markers.clear();
      for (var doc in querySnapshot.docs) {
        GeoPoint position = doc['position'];
        String title = doc['title'];
        String n = doc['user'];
        String description = doc['description'];
        String id = doc['id'];
        String color = doc['color'];
        double hue = double.parse(color);
        bool vis = doc['visible'];
        Marker marker = Marker(
          markerId: MarkerId(doc.id),
          position: LatLng(position.latitude, position.longitude),
          visible: vis,
          icon: BitmapDescriptor.defaultMarkerWithHue(hue),
          infoWindow: InfoWindow(
            title: title,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    int _counter = 0;
                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        backgroundColor: color1,
                        title: Text(
                          title,
                          style: GoogleFonts.urbanist(
                              color: color2,
                              fontWeight: FontWeight.bold,
                              fontSize: font4),
                        ),
                        actions: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Description of the Issue:',
                                  style: GoogleFonts.urbanist(
                                      fontSize: font2,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  description,
                                  style: GoogleFonts.urbanist(
                                    fontSize: font2,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Report made by: $n',
                                  style: GoogleFonts.urbanist(
                                    fontSize: font2,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      String lat = position.latitude.toString();
                                      String lon =
                                          position.longitude.toString();
                                      String body =
                                          'Dear eazyGo team,\n\n I am writing to bring to your attention on a false report that I came across,\nlatitude:$lat\nlongitude:$lon\nIssue:$title\nUser:$n\nWhile looking through the map, I noticed that there are some inaccurate and misleading facts that could potentially misinform the users and authority.\n\n I believe that it is crucial to ensure that all information on your site is correct and up-to-date, as this can greatly impact the trust and credibility of your platform. I kindly request that you review and revise the content in question to ensure its accuracy.\n\nThank you for your attention to this matter.\n\nSincerely,\n\n[Your Name]';
                                      Uri _emailLaunchUri = Uri(
                                        scheme: 'mailto',
                                        path: 'aswin_asokan@outlook.com',
                                        query:
                                            'subject=Report false issue&body=$body',
                                      );
                                      launchUrl(_emailLaunchUri);
                                    },
                                    child: Text(
                                      'Report Issue',
                                      style: GoogleFonts.urbanist(
                                          fontSize: font2,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: GoogleFonts.urbanist(
                                          fontSize: font2,
                                          fontWeight: FontWeight.w500,
                                          color: color2),
                                    )),
                              ],
                            ),
                          )
                        ],
                      );
                    });
                  });
            },
          ),
        );
        markers.add(marker);
      }
      setState(() {});
    });
  }

  double? icon;
  bool isVisible = false;
  String? _chosenValue1 = 'Poor Road Condition';
  String? desc;
  TextEditingController issueTf = TextEditingController();
  int i = 0;
  var font1, font2, font3, font4;
  @override
  DateTime? _currentBackPressTime;

  Future<bool> _onWillPop() async {
    SystemNavigator
        .pop(); // close the app and destroy the current activity or window
    return true;
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    var h = height * 0.23;
    //Font size
    font1 = height * 0.03;
    font2 = height * 0.02;
    font3 = width * 0.039;
    font4 = width * 0.07;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            padding: EdgeInsets.only(top: 250),
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            markers: Set.of(markers),
          ),
        ]),
        /*location
        report issue
        button
        here*/
        floatingActionButton: Container(
          width: width * 0.42,
          height: height * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    locatePosition();
                  },
                  icon: Icon(Icons.location_on_rounded),
                  iconSize: width * 0.07,
                  color: Color.fromRGBO(28, 103, 88, 1)),
              IconButton(
                  onPressed: () {
                    _getUsersFromFirestore();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const profilePage())));
                  },
                  icon: Icon(Icons.person_2_rounded),
                  iconSize: width * 0.07,
                  color: Color.fromRGBO(28, 103, 88, 1)),
              IconButton(
                iconSize: width * 0.07,
                onPressed: () {
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
                                        //_addMarker();
                                        _addMarkerToFirestore();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              content: Container(
                                height: h,
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Select Issue:',
                                            style: GoogleFonts.urbanist(
                                              fontSize: font3,
                                            ))),
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
                                                fontSize: font3,
                                                color: Colors.black),
                                            dropdownColor: Color.fromRGBO(
                                                217, 233, 230, 1),
                                            value: _chosenValue1,
                                            items: <String>[
                                              'Poor Road Condition',
                                              'Pipe Leakage',
                                              'Traffic Signals not Working',
                                              'Poor side walks',
                                              'No zebra Crossing',
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
                                                if (_chosenValue1 ==
                                                    'Poor Road Condition') {
                                                  icon = 0.0;
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
                                    TextField(
                                      cursorColor: Color(0xff1c6758),
                                      controller: issueTf,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff1c6758))),
                                          border: OutlineInputBorder(),
                                          hintText:
                                              'Enter description on the issue'),
                                      style:
                                          GoogleFonts.urbanist(fontSize: font3),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      });
                  setState(() {
                    _chosenValue1 = 'Poor Road Condition';
                    issueTf.clear();
                  });
                },
                icon: const Icon(Icons.report_problem_rounded),
                color: Color.fromRGBO(28, 103, 88, 1),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Color.fromRGBO(217, 233, 230, 1)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void onMapCreated(controller) async {
    setState(() {
      mapController = controller;
      locatePosition();
    });
  }
}
