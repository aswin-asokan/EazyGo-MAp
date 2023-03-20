import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class login_5 extends StatefulWidget {
  const login_5({super.key});

  @override
  State<login_5> createState() => _login_5State();
}

class _login_5State extends State<login_5> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: SafeArea(
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: IconButton(
                        alignment: Alignment(0, 0),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff1c6758),
                        ),
                        onPressed: null,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'OTP Verification',
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1c6758),
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(width: 50, height: 20)),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    if (!isKeyboard)
                      Image.asset(
                        'images/Frame.png',
                        height: 250,
                        width: 250,
                      ),
                    SizedBox(
                      height: 70,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter OTP',
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 5, 5, 5),
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'An 4 digit code has been sent to your number',
                        style: GoogleFonts.urbanist(
                          color: Color(0xff595959),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: TextFormField(
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ],
                              style: GoogleFonts.urbanist(
                                  color: Color.fromARGB(255, 12, 12, 12),
                                  fontSize: 20),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffC3E5DF),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: Color(0xffC3E5DF))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(28, 103, 88, 1))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(0xffC3E5DF)))),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: TextFormField(
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ],
                              style: GoogleFonts.urbanist(
                                  color: Color.fromARGB(255, 12, 12, 12),
                                  fontSize: 20),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffC3E5DF),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: Color(0xffC3E5DF))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(28, 103, 88, 1))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(0xffC3E5DF)))),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: TextFormField(
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ],
                              style: GoogleFonts.urbanist(
                                  color: Color.fromARGB(255, 12, 12, 12),
                                  fontSize: 20),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffC3E5DF),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: Color(0xffC3E5DF))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(28, 103, 88, 1))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(0xffC3E5DF)))),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: TextFormField(
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ],
                              style: GoogleFonts.urbanist(
                                  color: Color.fromARGB(255, 12, 12, 12),
                                  fontSize: 20),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffC3E5DF),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: Color(0xffC3E5DF))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(28, 103, 88, 1))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(0xffC3E5DF)))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ]),
          ),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          color: Colors.white,
          height: 160,
          child: Align(
            alignment: Alignment.center,
            child: Column(children: [
              SizedBox(
                  height: 57,
                  width: 356,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Verify',
                        style: GoogleFonts.urbanist(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1c6758),
                        foregroundColor: Colors.white),
                  )),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text('Resend OTP',
                    style: GoogleFonts.urbanist(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                style: TextButton.styleFrom(foregroundColor: Colors.black),
              ),
            ]),
          ),
        ));
  }
}
