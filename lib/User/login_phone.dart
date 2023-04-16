import 'package:eazygo_map/User/create_acc.dart';
import 'package:eazygo_map/User/login_email.dart';
import 'package:eazygo_map/User/req_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login_phone extends StatefulWidget {
  const login_phone({super.key});

  @override
  State<login_phone> createState() => _login_phoneState();
}

class _login_phoneState extends State<login_phone> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final font, size, size2;
    if (width < 350) {
      font = width * 0.04;
    } else {
      font = height * 0.02;
    }
    if (!isKeyboard) {
      size = height * 0.08;
      size2 = height * 0.1;
    } else {
      size = height * 0.03;
      size2 = height * 0.06;
    }
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: size2,
            ),
            /*Text
        starts
        here*/
            if (!isKeyboard)
              Text('Login Account',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                      color: Color(0xff1c6758),
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.w700)),
            if (!isKeyboard)
              SizedBox(
                height: height * 0.01,
              ),
            if (!isKeyboard)
              Text(
                'Hello! Welcome back to your account',
                style: GoogleFonts.urbanist(
                    color: Color.fromARGB(255, 8, 8, 8),
                    fontSize: height * 0.02),
              ),
            if (!isKeyboard)
              SizedBox(
                height: height * 0.1,
              ),
            /*Nav button
        starts
        here*/
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: height * 0.08,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xffC3E5DF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.4,
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
                              fontSize: font, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.4,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              (MaterialPageRoute(
                                  builder: (context) => login_email())));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            foregroundColor: Colors.black),
                        child: Text(
                          'Email',
                          style: GoogleFonts.urbanist(
                              fontSize: font, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*Text field
        starts
        here*/

            SizedBox(
              height: size,
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
                      child: TextFormField(
                        initialValue: '+91',
                        style: GoogleFonts.urbanist(
                            color: Color.fromRGBO(155, 155, 155, 1),
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          enabled: false,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff1c6758))),
                        ),
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
                              borderSide: BorderSide(color: Color(0xff1c6758))),
                          hintStyle: GoogleFonts.urbanist(fontSize: font),
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
      /*bottom sheet
        starts
        here*/
      bottomSheet: Container(
          color: Colors.white,
          height: height * 0.25,
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              (MaterialPageRoute(
                                  builder: (context) => req_otp())));
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xff1c6758))),
                        child: Text(
                          'Request OTP',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                              color: Colors.white,
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    height: height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not Registered Yet?',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 120, 118, 118),
                              fontSize: font),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                (MaterialPageRoute(
                                    builder: (context) => const create_acc())));
                          },
                          child: Text(
                            'Create an account',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                color: Color(0xff1c6758),
                                fontSize: font),
                          ),
                        ),
                      ],
                    ),
                  )
                ]))),
          )),
    ));
    ;
  }
}
