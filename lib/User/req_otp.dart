import 'package:eazygo_map/Profile/ContactUs.dart';
import 'package:eazygo_map/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class req_otp extends StatefulWidget {
  const req_otp({super.key});

  @override
  State<req_otp> createState() => _req_otpState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

String smsCode = '';

class _req_otpState extends State<req_otp> {
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
                Text('OTP Verification',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                        color: Color(0xff1c6758),
                        fontSize: height * 0.04,
                        fontWeight: FontWeight.w700)),
              SizedBox(
                height: height * 0.03,
              ),
              if (!isKeyboard)
                Container(
                  alignment: Alignment.center,
                  height: height * 0.23,
                  child: Image.asset(
                    'images/Frame.png',
                  ),
                ),
              if (!isKeyboard)
                SizedBox(
                  height: height * 0.03,
                ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter OTP',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontSize: height * 0.03),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'A 4 digit code has been sent to your number',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.urbanist(
                        color: Colors.black26, fontSize: height * 0.021),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              OtpTextField(
                filled: true,
                fillColor: Color(0xffC3E5DF),
                numberOfFields: 6,
                textStyle: GoogleFonts.urbanist(
                    fontSize: width * 0.07, color: Color(0xff1c6758)),
                fieldWidth: width * 0.12,
                showFieldAsBox: true,
                enabledBorderColor: Color(0xffC3E5DF),
                borderColor: Color(0xffC3E5DF),
                disabledBorderColor: Color(0xffC3E5DF),
                focusedBorderColor: Color(0xffC3E5DF),
                cursorColor: Color(0xff1c6758),
                onSubmit: (value) {
                  smsCode = value;
                },
              )
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
                            await _auth.verifyPhoneNumber(
                              verificationCompleted: (phoneAuthCredential) {
                                // Called when the verification is complete automatically (e.g. when testing on iOS)
                                _auth.signInWithCredential(phoneAuthCredential);
                              },
                              verificationFailed: (error) {
                                // Called when the verification fails (e.g. if the phone number is invalid)
                                print(error.toString());
                              },
                              codeSent: (verificationId, resendToken) {
                                // Called when the OTP code is sent to the user's phone number
                                // Store the verification ID and the resend token in a local variable

                                // Display a dialog box to the user to enter the OTP code
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    final wid =
                                        MediaQuery.of(context as BuildContext)
                                            .size
                                            .width;
                                    return AlertDialog(
                                        title: Text(
                                          'Enter Verification Code',
                                        ),
                                        content: OtpTextField(
                                          filled: true,
                                          fillColor: Color(0xffC3E5DF),
                                          numberOfFields: 6,
                                          textStyle: GoogleFonts.urbanist(
                                              fontSize: wid * 0.06,
                                              color: Color(0xff1c6758)),
                                          showFieldAsBox: true,
                                          fieldWidth: wid * 0.1,
                                          enabledBorderColor: Color(0xffC3E5DF),
                                          borderColor: Color(0xffC3E5DF),
                                          disabledBorderColor:
                                              Color(0xffC3E5DF),
                                          focusedBorderColor: Color(0xffC3E5DF),
                                          cursorColor: Color(0xff1c6758),
                                          onSubmit: (value) {
                                            smsCode = value;
                                          },
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            child: Text('Done'),
                                            onPressed: () async {
                                              // Call signInWithCredential() to sign in with the OTP code
                                              AuthCredential credential =
                                                  PhoneAuthProvider.credential(
                                                      verificationId:
                                                          verificationId,
                                                      smsCode: smsCode);
                                              await _auth.signInWithCredential(
                                                  credential);
                                              Navigator.pop(context);
                                            },
                                          )
                                        ]);
                                  },
                                );
                              },
                              codeAutoRetrievalTimeout: (verificationId) {},
                              timeout: Duration(seconds: 60),
                            );
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xff1c6758))),
                          child: Text(
                            'Verify',
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
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Resend OTP',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: font),
                          ),
                        ),
                      ),
                    ),
                  ]))),
            )),
      ),
    );
  }
}
