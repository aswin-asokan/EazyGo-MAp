import 'package:eazygo_map/User/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:eazygo_map/User/account.dart';
import 'package:eazygo_map/User/login.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:google_fonts/google_fonts.dart';

class login_1 extends StatefulWidget {
  const login_1({super.key});

  @override
  State<login_1> createState() => _login_1State();
}

class _login_1State extends State<login_1> {
  @override
  Widget build(BuildContext context) {
/*<<<<<<< HEAD
=======
    final Size screenSize = MediaQuery.of(context).size;
>>>>>>> master*/
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Login Account',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1c6758),
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hello! Welcome back to your account',
                    style: GoogleFonts.urbanist(
                        color: Color.fromARGB(255, 8, 8, 8), fontSize: 15),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
//<<<<<<< HEAD
                  width: 390,
/*=======
                  width: screenSize.width,
>>>>>>> master*/
                  height: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffC3E5DF),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 44,
                        width: 152,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black),
                          child: Text(
                            'Phone Number',
                            style: GoogleFonts.urbanist(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 44,
                          width: 172,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                (MaterialPageRoute(
                                    builder: (context) => login_2())),
                              );
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Text(
                              'Email',
                              style: GoogleFonts.urbanist(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
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
                          style:
                              GoogleFonts.urbanist(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff1c6758))),
                              hintStyle: GoogleFonts.urbanist(fontSize: 17),
                              hintText: '+91'),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextField(
                          cursorColor: Color.fromRGBO(28, 103, 88, 1),
                          style:
                              GoogleFonts.urbanist(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1c6758))),
                            hintStyle: GoogleFonts.urbanist(fontSize: 17),
                            hintText: 'Phone Number',
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
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        color: Colors.white,
        height: 160,
        child: Column(
          children: [
            SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      (MaterialPageRoute(builder: (context) => login_5())),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1c6758),
                      foregroundColor: Colors.white),
                  child: Text(
                    'Request OTP',
                    style: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                )),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  (MaterialPageRoute(builder: (context) => login_3())),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not Registered Yet?',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 120, 118, 118)),
                  ),
                  Text(
                    ' Create an account',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600, color: Color(0xff1c6758)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
