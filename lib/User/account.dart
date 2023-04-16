import 'package:flutter/material.dart';
import 'package:eazygo_map/User/profile.dart';
import 'package:google_fonts/google_fonts.dart';

class login_3 extends StatefulWidget {
  const login_3({super.key});

  @override
  State<login_3> createState() => _login_3State();
}

class _login_3State extends State<login_3> {
  @override
  Widget build(BuildContext context) {
    var _isHidden = true;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: IconButton(
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Create Account',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1c6758),
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hello! Lets create on Account',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 8, 8, 8),
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(width: 50, height: 20)),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    if (!isKeyboard)
                      Image.asset(
                        'images/image 10.png',
                        height: 250,
                        width: 250,
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        // Smaller TextField
                        SizedBox(
                          width: 30,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '+91',
                                hintStyle: GoogleFonts.urbanist()),
                          ),
                        ),
                        SizedBox(
                          width: 5,
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
                              hintText: 'Phone number',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
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
                          width: 5,
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
                    SizedBox(
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
                            obscureText: _isHidden,
                            cursorColor: Color.fromRGBO(28, 103, 88, 1),
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff1c6758))),
                                hintStyle: GoogleFonts.urbanist(fontSize: 17),
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                    focusColor: Color.fromRGBO(28, 103, 88, 1),
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        // Smaller TextField
                        SizedBox(
                          width: 30,
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline_rounded)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                suffixIcon: Icon(Icons.visibility)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
      bottomSheet: Container(
//<<<<<<< HEAD
        height: 100,
/*=======
        height: 160,
>>>>>>> master*/
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                  height: 57,
                  width: 356,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Next'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1c6758),
                        foregroundColor: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
