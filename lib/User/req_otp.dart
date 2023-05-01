import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class req_otp extends StatefulWidget {
  const req_otp({super.key});

  @override
  State<req_otp> createState() => _req_otpState();
}

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
                numberOfFields: 4,
                textStyle: GoogleFonts.urbanist(
                    fontSize: 25, color: Color(0xff1c6758)),
                fieldWidth: width * 0.16,
                showFieldAsBox: true,
                enabledBorderColor: Color(0xffC3E5DF),
                borderColor: Color(0xffC3E5DF),
                disabledBorderColor: Color(0xffC3E5DF),
                focusedBorderColor: Color(0xffC3E5DF),
                cursorColor: Color(0xff1c6758),
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
                          onPressed: () {},
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
