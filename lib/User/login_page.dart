import 'package:eazygo_map/User/create_acc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_phone.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final font1, font2;
    if (width < 500) {
      font1 = height * 0.03;
      font2 = height * 0.02;
    } else {
      font1 = height * 0.07;
      font2 = height * 0.06;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              alignment: Alignment.center,
              height: height * 0.4,
              child: Image.asset(
                'images/image 6.png',
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text('Find complete maps service',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    color: Color(0xff1c6758),
                    fontSize: font1,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
                'A map is a symbolic representation of selected characteristics of a place,usually drawn on a flat surface',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  color: Color.fromARGB(255, 125, 123, 123),
                  fontSize: height * 0.02,
                )),
          ],
        ),
        /*bottom sheet
        starts
        here*/
        bottomSheet: Container(
          height: height * 0.25,
          width: double.infinity,
          color: Color(0xff1c6758),
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.06,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  (MaterialPageRoute(
                                      builder: (context) => login_phone())));
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.white)),
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.urbanist(
                                  color: Colors.black,
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        height: height * 0.06,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  (MaterialPageRoute(
                                      builder: (context) => create_acc())));
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.black)),
                            child: Text(
                              'Create an Account',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.urbanist(
                                  color: Colors.white,
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
