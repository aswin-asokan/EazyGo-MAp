import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class create_profile extends StatefulWidget {
  const create_profile({super.key});

  @override
  State<create_profile> createState() => _create_profileState();
}

class _create_profileState extends State<create_profile> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final font, size1, size2, rad, l, t;
    if (width < 350) {
      font = width * 0.04;
      rad = width * 0.25;
      l = width * 0.34;
      t = height * 0.17;
    } else {
      font = height * 0.02;
      rad = height * 0.13;
      l = height * 0.18;
      t = height * 0.2;
    }
    print(l);
    print(t);
    if (!isKeyboard) {
      size1 = height * 0.06;
      size2 = height * 0.1;
    } else {
      size1 = height * 0.02;
      size2 = height * 0.06;
    }
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Align(
              alignment: Alignment.center,
              child: Column(children: [
                SizedBox(
                  height: size2,
                ),
                /*Text
          starts
          here*/
                if (!isKeyboard)
                  Text('Create Profile',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.urbanist(
                          color: Color(0xff1c6758),
                          fontSize: height * 0.04,
                          fontWeight: FontWeight.w700)),
                if (!isKeyboard)
                  SizedBox(
                    height: height * 0.05,
                  ),
                if (!isKeyboard)
                  Stack(
                    children: [
                      /*Container(
                        height: height * 0.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffC3E5DF)),
                      ),*/
                      CircleAvatar(
                        child: Image.asset(
                          'images/Group 129.png',
                        ),
                        radius: rad,
                        backgroundColor: Color(0xffC3E5DF),
                      ),
                      Positioned(
                          left: l,
                          top: t,
                          child: IconButton(
                            iconSize: 30,
                            color: Color(0xff1c6758),
                            onPressed: () {},
                            icon: Icon(Icons.add_a_photo_rounded),
                          ))
                    ],
                  ),
                SizedBox(
                  height: size1,
                ),
                /*text field
                start
                her*/
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Smaller TextField
                              SizedBox(
                                width: 30,
                                child: TextField(
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person_2_outlined),
                                    enabled: false,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1c6758))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: TextField(
                                  cursorColor: Color.fromRGBO(28, 103, 88, 1),
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1c6758))),
                                    hintStyle:
                                        GoogleFonts.urbanist(fontSize: font),
                                    hintText: 'User Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      /*textfield 2
                  starts
                  here*/
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Smaller TextField
                              SizedBox(
                                width: 30,
                                child: TextField(
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.badge_outlined),
                                    enabled: false,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1c6758))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: TextField(
                                  cursorColor: Color.fromRGBO(28, 103, 88, 1),
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1c6758))),
                                    hintStyle:
                                        GoogleFonts.urbanist(fontSize: font),
                                    hintText: 'Full Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      /*textfield 2
                  starts
                  here*/
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Smaller TextField
                              SizedBox(
                                width: 30,
                                child: TextField(
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.my_location_outlined),
                                    enabled: false,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1c6758))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: TextField(
                                  cursorColor: Color.fromRGBO(28, 103, 88, 1),
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1c6758))),
                                    hintStyle:
                                        GoogleFonts.urbanist(fontSize: font),
                                    hintText: 'Location',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            /*bottom sheet
        starts
        here*/
            bottomSheet: Container(
                color: Colors.white,
                height: height * 0.2,
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          child: Column(children: [
                            Container(
                              height: height * 0.06,
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color(0xff1c6758))),
                                  child: Text(
                                    'Create',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.urbanist(
                                        color: Colors.white,
                                        fontSize: height * 0.02,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ]),
                        ))))));
  }
}
