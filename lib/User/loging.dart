import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:eazygo_map/User/account.dart';
import 'package:eazygo_map/User/log.dart';
import 'package:eazygo_map/User//login.dart';
import 'package:google_fonts/google_fonts.dart';

class Loging extends StatelessWidget {
  const Loging({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/image 6.png',
                    width: 300,
                    height: 300,
                  ),
                  Text('Find complete maps service',
                      style: GoogleFonts.urbanist(
                          color: Color(0xff1c6758),
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      'A map is a symbolic representation of selected',
                      style: GoogleFonts.urbanist(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Color.fromARGB(255, 125, 123, 123)),
                    ),
                  ),
                  Center(
                    child: Text(
                      'characteristics of a place,usually drawn on a flat ',
                      style: GoogleFonts.urbanist(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Color.fromARGB(255, 125, 123, 123)),
                    ),
                  ),
                  Center(
                    child: Text(
                      'surface ',
                      style: GoogleFonts.urbanist(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Color.fromARGB(255, 125, 123, 123)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Color(0xff1c6758),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => login_1())));
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white)),
                      child: Text(
                        '                        Login                        ',
                        style: GoogleFonts.urbanist(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          (MaterialPageRoute(builder: (context) => login_3())),
                        );
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black)),
                      child: Text(
                        '            Create an Account            ',
                        style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              )),
            ),
          ),
        ],
      ),
    ));
  }
}
