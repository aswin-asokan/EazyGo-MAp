import 'package:eazygo_map/Profile/ContactUs.dart';
import 'package:eazygo_map/User/create_acc.dart';
import 'package:eazygo_map/User/create_profile.dart';
import 'package:eazygo_map/User/create_profilePhone.dart';
import 'package:eazygo_map/variables.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class create_accPhn extends StatefulWidget {
  const create_accPhn({super.key});

  @override
  State<create_accPhn> createState() => _create_accState();
}

class _create_accState extends State<create_accPhn> {
  final TextEditingController phn = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  void generateOTP(String phoneNumber) async {
    // Call verifyPhoneNumber() to start the OTP verification process
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        // Called when the verification is complete automatically (e.g. when testing on iOS)
        _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        // Called when the verification fails (e.g. if the phone number is invalid)
        print(error.toString());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error Try Again Later'),
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xff1c6758),
        ));
      },
      codeSent: (verificationId, resendToken) {
        // Called when the OTP code is sent to the user's phone number
        // Store the verification ID and the resend token in a local variable
        String smsCode = '';

        // Display a dialog box to the user to enter the OTP code
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
                    // Call signInWithCredential() to sign in with the OTP code
                    AuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: smsCode);
                    await _auth.signInWithCredential(credential);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => create_profilPhone())));
                  },
                ),
              )
            ],
          ),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: Duration(seconds: 60),
    );
  }

  var errormessage = "";
  bool _isvisible = false;

  @override
  var isHidden1 = true;
  var isHidden2 = true;
  Widget build(BuildContext context) {
    void dispose() {
      phn.dispose();
      super.dispose();
    }

    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final font, size1, size2;
    if (width < 350) {
      font = width * 0.04;
    } else {
      font = height * 0.02;
    }
    if (!isKeyboard) {
      size1 = height * 0.08;
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
              Text('Create Account',
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
                'Hello! Lets create on Account',
                style: GoogleFonts.urbanist(
                    color: Color.fromARGB(255, 8, 8, 8),
                    fontSize: height * 0.02),
              ),
            if (!isKeyboard)
              SizedBox(
                height: height * 0.05,
              ),

            /*nav button
              starts
              from
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
                          Navigator.push(
                              context,
                              (MaterialPageRoute(
                                  builder: (context) => create_acc())));
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
            SizedBox(
              height: height * 0.02,
            ),
            /*Text field 1
        starts
        here*/
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  /*text field 2
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
                            child: TextFormField(
                              initialValue: '+91',
                              style: GoogleFonts.urbanist(
                                  color: Color.fromRGBO(155, 155, 155, 1),
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                enabled: false,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff1c6758))),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextField(
                              maxLength: 10,
                              controller: phn,
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                counterText: '',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff1c6758))),
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
                          onPressed: () {
                            provider = phn.text;
                            generateOTP('+91' + phn.text);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xff1c6758))),
                          child: Text(
                            'Next',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ]))),
            )),
      ),
    );
  }
}
