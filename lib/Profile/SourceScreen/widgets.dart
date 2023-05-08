import 'dart:io';

import 'package:eazygo_map/Profile/editProfile.dart';
import 'package:eazygo_map/User/login_page.dart';
import 'package:eazygo_map/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Variables.dart';

class rotation extends StatefulWidget {
  const rotation({super.key});

  @override
  State<rotation> createState() => _rotationState();
}

class _rotationState extends State<rotation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  itemList(var title, Icon ic) {
    var uTitle = title;
    var icon = ic;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 360,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: _rotationAnimation.value * 0.0174533,
        child: Image.asset(
          'images/rotate.png',
          scale: 1.5,
        ),
      ),
    );
  }
}

class profile extends StatefulWidget {
  late Function(ImageSource) getImage;
  profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with SingleTickerProviderStateMixin {
  File? _image;

  Future getImage_gallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    //final imageTemporary = File(image.path);
    imagePermanent = await saveFilePermenently(image.path);

    setState(() {
      _image = imagePermanent;
    });
  }

  Future getImage_camera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    //final imageTemporary = File(image.path);
    imagePermanent = await saveFilePermenently(image.path);

    setState(() {
      //this._image = imageTemporary;
      _image = imagePermanent;
    });
  }

  Future<File> saveFilePermenently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 180,
      child: Stack(
        children: [
          Center(
            child: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(60), // Image radius
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                  width: 10,
                  height: 10,
                ),
              ),
            ),
          ),
          const Center(
            child: rotation(),
          ),
          Positioned(
            top: 105,
            left: 105,
            child: IconButton(
                color: Color(0xff1c6758),
                iconSize: 30,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: height * 0.3,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text('Choose image',
                                  style: GoogleFonts.urbanist(
                                      color: Color(0xff1c6758),
                                      fontWeight: FontWeight.bold,
                                      fontSize: height * 0.03)),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      img = 'images/kindpng_1636340.png';
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                        height: width * 0.36,
                                        'images/kindpng_1636340.png'),
                                  ),
                                  SizedBox(
                                    width: width * 0.08,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      img = 'images/pngegg.png';
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                        height: width * 0.36,
                                        'images/pngegg.png'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                icon: Icon(Icons.add_a_photo_rounded)),
          )
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Widget bottomSheet_image({VoidCallback? editCam, VoidCallback? editgall}) {
  return Container(
    height: 100,
    width: 400,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        Text("Choose Profile Image"),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                editCam!();
              },
              splashColor: Colors.grey[100],
              child: Container(
                width: 80,
                child: Column(
                  children: [
                    Icon(
                      Icons.photo_camera_sharp,
                      color: Color(0xff1C6758),
                      size: 30,
                    ),
                    Text("Camera")
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                editgall!();
              },
              splashColor: Colors.grey[100],
              child: Container(
                width: 80,
                child: Column(
                  children: [
                    Icon(
                      Icons.image_rounded,
                      color: Color(0xff1C6758),
                      size: 30,
                    ),
                    Text("Photos")
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class card_Checkbox extends StatefulWidget {
  late String title;
  late String svgPath;
  late String? notice;
  bool isActive = true;
  late bool line_visible;

  card_Checkbox(
      {super.key,
      required this.title,
      required this.svgPath,
      this.notice,
      required this.isActive,
      required this.line_visible});
  @override
  State<card_Checkbox> createState() => _card_CheckboxState();
}

class _card_CheckboxState extends State<card_Checkbox> {
  late String _title;
  late String _svgPath;
  late String? _notice;
  bool? Checkbox_value = true;
  bool _isActive = true;
  late bool _line_visible;
  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _svgPath = widget.svgPath;
    _notice = widget.notice;
    _isActive = widget.isActive;
    _line_visible = widget.line_visible;
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !_isActive,
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: SvgPicture.asset(_svgPath,
                        color:
                            _isActive ? Color(0xff1C6758) : Color(0xff686868))),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 9,
                    child: Row(
                      children: [
                        Text(
                          _title,
                          style: TextStyle(
                              fontSize: 16,
                              color: _isActive
                                  ? Color(0xff1C6758)
                                  : Color(0xff686868)),
                        ),
                        Text(
                          _notice!,
                          style: TextStyle(
                              fontSize: 10,
                              color: _isActive
                                  ? Color(0xff1C6758)
                                  : Color(0xff686868)),
                        ),
                      ],
                    )),
                Checkbox(
                  value: _isActive ? Checkbox_value : Checkbox_value = false,
                  onChanged: (value) {
                    setState(() {
                      Checkbox_value = value;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                    side: BorderSide(color: Colors.grey),
                  ),
                  activeColor:
                      _isActive ? Color(0xff1C6758) : Color(0xff686868),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Visibility(
              visible: _line_visible,
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Widget card(
    {required String title,
    bool line_visible = true,
    required var svgPath,
    var page,
    var context}) {
  return InkWell(
    splashColor: Colors.grey[100],
    onTap: () {
      navigateTo(context, page);
    },
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: SvgPicture.asset(
                svgPath,
                color: Color(0xff1C6758),
              )),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  flex: 10,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18),
                  )),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
              visible: line_visible,
              child:
                  // Divider(
                  //       color: Colors.black,
                  //       thickness: 1,
                  //     ),
                  Container(
                height: 1,
                color: Colors.grey,
              )),
        ],
      ),
    ),
  );
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Widget Title_m({
  required var Title,
  bool arrow_visible = true,
  var Page,
  var context,
}) {
  return Container(
    width: double.infinity,
    child: Stack(
      children: [
        Align(
            //alignment: Alignment.bottomCenter,
            child: Text(
          Title,
          style: TextStyle(
              color: Color(0xff1C6758),
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ))
      ],
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Widget textField({
  required var svgPath,
  required var hintText,
  required var controller,
}) {
  return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      svgPath,
                      color: Color(0xff595959),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      color: Color(0xff595959),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 9,
              child: TextField(
                textAlign: TextAlign.start,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: hintText,
                  focusColor: mainColor,
                ),
                cursorColor: mainColor,
              ))
        ],
      ));
}

Widget textField1({
  required var svgPath,
  required var hintText,
  required var controller,
}) {
  return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      svgPath,
                      color: Color(0xff595959),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      color: Color(0xff595959),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 9,
              child: TextField(
                textAlign: TextAlign.start,
                controller: controller,
                decoration: InputDecoration(
                  enabled: false,
                  contentPadding: EdgeInsets.only(top: 10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: hintText,
                  focusColor: mainColor,
                ),
                cursorColor: mainColor,
              ))
        ],
      ));
}

class MyButton extends StatefulWidget {
  late String Title;
  late VoidCallback onPress;

  MyButton({super.key, required this.Title, required this.onPress});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  late String _title;
  late VoidCallback _onpress;
  @override
  void initState() {
    super.initState();
    _title = widget.Title;
    _onpress = widget.onPress;
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onpress;
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff0C9479),
                Color(0xff1C6758),
              ],
            ),
            borderRadius: BorderRadius.circular(9)),
        child: Center(
          child: Text(
            _title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      //height: 150,
      child: Stack(
        children: [
          Center(
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(50), // Image radius
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                  width: 10,
                  height: 10,
                ),
              ),
            ),
          ),
          const Center(
            child: rotation(),
          ),
        ],
      ),
    );
  }
}

Widget UserName({
  required var usernmae,
}) {
  return Container(
      width: double.infinity,
      child: Center(
          child: Text(
        usernmae,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: mainColor),
      )));
}

Widget profileButton1({
  var title,
  var icon,
  var context,
  var page,
}) {
  return Column(
    children: [
      SizedBox(
        height: 2,
      ),
      InkWell(
        onTap: (() {
          Navigator.pushReplacement(context,
              (MaterialPageRoute(builder: (context) => editProfile())));
        }),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xffF0FEFB),
              border: Border.all(width: 1.5, color: Color(0xff1C6758)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1C6758)),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 2,
      )
    ],
  );
}

Widget profileButton2({
  var title,
  var icon,
  var context,
  var page,
}) {
  return Column(
    children: [
      SizedBox(
        height: 2,
      ),
      InkWell(
        onTap: (() async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('email');
          await prefs.remove('password');
          await prefs.remove('phoneNumber');
          await prefs.remove('verificationId');
          await prefs.remove('location');
          await prefs.remove('userName');
          await prefs.remove('img');
          await prefs.remove('provider');
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(
              context, (MaterialPageRoute(builder: (context) => login_page())));
        }),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xffF0FEFB),
              border: Border.all(width: 1.5, color: Color(0xff1C6758)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1C6758)),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 2,
      )
    ],
  );
}

Widget countProfile() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50),
    //height: 200,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          //width: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$feedsCount+',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: mainColor),
              ),
              Text("feeds")
            ],
          ),
        ),
        Container(
          height: 60,
          //width: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$reportCount+',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: mainColor),
              ),
              Text("reports")
            ],
          ),
        )
      ],
    ),
  );
}

Widget reportCard({
  var title,
  var icon,
  var desc,
  var loc,
  var type,
  VoidCallback? delete,
}) {
  var block = "images/road.png";
  var leak = "images/leaking.png";
  var other = "images/report.png";
  var location = "perumbavoor";
  var Type = "block";
  return Container(
    //color: Colors.amber,
    width: double.infinity,
    height: 100,
    margin: EdgeInsets.only(left: 15, right: 15),
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        Positioned(
          right: 0.0,
          child: Container(
              height: 100,
              width: 280,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 185, 185, 185),
                        blurRadius: 10.0,
                        spreadRadius: 1,
                        offset: Offset(2, 2)),
                  ]),
              child: Container(
                // color: Colors.white.withOpacity(1),
                margin: EdgeInsets.only(left: 30, top: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "24 April 2023",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: mainColor,
                      height: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.grey[600],
                          size: 15,
                        ),
                        Text(
                          location,
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 31, 12, 12)),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
        Positioned(
          top: 8,
          child: Container(
            padding: EdgeInsets.all(10),
            height: 80,
            width: 60,
            decoration: BoxDecoration(
                color: Type == "block"
                    ? Colors.redAccent
                    : Type == "leak"
                        ? Colors.blueAccent
                        : Type == "others"
                            ? Colors.greenAccent
                            : Colors.black26,
                borderRadius: BorderRadius.circular(9),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 185, 185, 185),
                      blurRadius: 10.0,
                      spreadRadius: 1,
                      offset: Offset(2, 2)),
                ]),
            child: Container(
              height: 10,
              width: 10,
              child: Type == "block"
                  ? Image.asset(block)
                  : Type == "leak"
                      ? Image.asset(leak)
                      : Type == "others"
                          ? Image.asset(other)
                          : Image.asset(leak),
            ),
          ),
        ),
      ],
    ),
  );
}

class ReportCard extends StatefulWidget {
  const ReportCard({super.key});

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  var block = "images/road.png";
  var leak = "images/leaking.png";
  var other = "images/report.png";
  var title = uname.text;
  var location = "perumbavoor";
  var Type = "others";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            right: 0.0,
            child: Container(
                height: 100,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 185, 185, 185),
                          blurRadius: 10.0,
                          spreadRadius: 1,
                          offset: Offset(2, 2)),
                    ]),
                child: Container(
                  // color: Colors.white.withOpacity(1),
                  margin: EdgeInsets.only(left: 30, top: 15, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "24 April 2023",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: mainColor,
                        height: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.grey[600],
                            size: 15,
                          ),
                          Text(
                            location,
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 31, 12, 12)),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            top: 8,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 80,
              width: 60,
              decoration: BoxDecoration(
                  color: Type == "block"
                      ? Colors.redAccent
                      : Type == "leak"
                          ? Colors.blueAccent
                          : Type == "others"
                              ? Colors.greenAccent
                              : Colors.black26,
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 185, 185, 185),
                        blurRadius: 10.0,
                        spreadRadius: 1,
                        offset: Offset(2, 2)),
                  ]),
              child: Container(
                height: 10,
                width: 10,
                child: Type == "block"
                    ? Image.asset(block)
                    : Type == "leak"
                        ? Image.asset(leak)
                        : Type == "others"
                            ? Image.asset(other)
                            : Image.asset(leak),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}

class CardWidget extends StatefulWidget {
  CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  var text = uname.text;
  var id;
  bool boxcheck = false;
  // var checkbox =newlist.text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        color: Color.fromARGB(255, 232, 232, 232),
        shadowColor: Colors.black,
        elevation: 2,
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Checkbox(
                    value: boxcheck,
                    onChanged: (value) {
                      setState(() {
                        boxcheck = !boxcheck;
                      });
                    }),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  text,
                  style: TextStyle(
                      decoration: boxcheck ? TextDecoration.lineThrough : null),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            // todo.remove(CardWidget());
                          });
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
