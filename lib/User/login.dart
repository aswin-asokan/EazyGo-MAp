import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:eazygo_map/User/account.dart';
import 'package:eazygo_map/User/log.dart';
import 'package:google_fonts/google_fonts.dart';

class login_2 extends StatefulWidget {
  const login_2({super.key});

  @override
  State<login_2> createState() => _login_2State();
}

class _login_2State extends State<login_2> {
  var _isHidden = true;
  @override
  Widget build(BuildContext context) {
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
                  width: 390,
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
                        width: 132,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              (MaterialPageRoute(
                                  builder: (context) => login_1())),
                            );
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black),
                          child: Text('Phone Number',
                              style: GoogleFonts.urbanist(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 44,
                        width: 162,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black),
                          child: Text(
                            'Email',
                            style: GoogleFonts.urbanist(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Smaller TextField
                        SizedBox(
                          width: 30,
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.alternate_email_rounded)),
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
                                  borderSide:
                                      BorderSide(color: Color(0xff1c6758))),
                              hintStyle: GoogleFonts.urbanist(fontSize: 17),
                              hintText: 'Email Id',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        // Smaller TextField
                        SizedBox(
                          width: 30,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextField(
                            cursorColor: Color.fromRGBO(28, 103, 88, 1),
                            obscureText: _isHidden,
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff1c6758))),
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                    hoverColor: Color(0xff1c6758),
                                    focusColor: Color(0xff1c6758),
                                    onPressed: () {
                                      setState(() {
                                        _isHidden = !_isHidden;
                                      });
                                    },
                                    icon: Icon(_isHidden == true
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined))),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1c6758),
                      foregroundColor: Colors.white),
                  child: Text(
                    'Login',
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
