import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazygo_map/User/create_acc.dart';
import 'package:eazygo_map/User/create_accPhn.dart';
import 'package:eazygo_map/User/login_email.dart';
import 'package:eazygo_map/Map/map.dart';
import 'package:eazygo_map/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login_phone extends StatefulWidget {
  const login_phone({super.key});

  @override
  State<login_phone> createState() => _login_phoneState();
}

class _login_phoneState extends State<login_phone> {
  TextEditingController phoneNum = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    phoneNum.dispose();
    super.dispose();
  }

// Create an instance of the FirebaseAuth class
  FirebaseAuth _auth = FirebaseAuth.instance;

  void generateOTP(String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        print(error.toString());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error Try Again Later'),
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xff1c6758),
        ));
      },
      codeSent: (verificationId, resendToken) {
        String smsCode = '';

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text(
              'OTP Verification',
              style: GoogleFonts.urbanist(
                  color: Color(0xff1c6758),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            content: TextField(
              textAlign: TextAlign.center,
              maxLength: 6,
              cursorColor: Color(0xff1c6758),
              decoration: InputDecoration(
                counterText: '',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff1c6758))),
                hintStyle: GoogleFonts.urbanist(fontSize: 15),
                hintText: 'Enter OTP here',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                smsCode = value;
              },
            ),
            actions: <Widget>[
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    'OK',
                    style: GoogleFonts.urbanist(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1c6758)),
                  ),
                  onPressed: () async {
                    AuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: smsCode);
                    await _auth.signInWithCredential(credential);

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) => const Map())));
                  },
                ),
              )
            ],
          ),
        );
        SharedPreferences prefs =
            SharedPreferences.getInstance() as SharedPreferences;
        prefs.setString('verificationId', verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: Duration(seconds: 60),
    );
  }

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
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(
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
                    SizedBox(
                      width: width * 0.04,
                    ),
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
                        maxLength: 10,
                        controller: phoneNum,
                        cursorColor: Color.fromRGBO(28, 103, 88, 1),
                        style:
                            GoogleFonts.urbanist(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          counterText: '',
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
                        onPressed: () async {
                          ph = phoneNum.text;
                          if (ph!.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Enter phone number'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Color(0xff1c6758),
                            ));
                          }
                          QuerySnapshot querySnapshot = await FirebaseFirestore
                              .instance
                              .collection('USERS')
                              .where('provider', isEqualTo: ph)
                              .get();
                          if (querySnapshot.docs.isNotEmpty) {
                            for (var doc in querySnapshot.docs) {
                              prov = doc['provider'];
                              provider = prov;
                              userName = doc['Name'];
                              img = doc['image'];
                              location = doc['Location'];
                            }
                          }
                          if (ph == prov) {
                            generateOTP('+91' + phoneNum.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Phone number not registered'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Color(0xff1c6758),
                            ));
                          }

                          //
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
