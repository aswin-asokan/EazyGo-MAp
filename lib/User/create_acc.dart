import 'package:eazygo_map/User/create_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class create_acc extends StatefulWidget {
  const create_acc({super.key});

  @override
  State<create_acc> createState() => _create_accState();
}

class _create_accState extends State<create_acc> {
  @override
  var isHidden1 = true;
  var isHidden2 = true;
  Widget build(BuildContext context) {
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
                height: height * 0.01,
              ),
            /*image
              starts
              from
              her*/
            if (!isKeyboard)
              Container(
                alignment: Alignment.center,
                height: height * 0.26,
                child: Image.asset(
                  'images/image 10.png',
                ),
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
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
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
                            child: TextField(
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.alternate_email_rounded),
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
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff1c6758))),
                                hintStyle: GoogleFonts.urbanist(fontSize: font),
                                hintText: 'Email ID',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  /*textfield 3
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
                            child: TextField(
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline_rounded),
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
                              obscureText: isHidden1,
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    color: Color.fromRGBO(155, 155, 155, 1),
                                    onPressed: () {
                                      setState(() {
                                        isHidden1 = !isHidden1;
                                      });
                                    },
                                    icon: Icon(isHidden1 == true
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff1c6758))),
                                hintStyle: GoogleFonts.urbanist(fontSize: font),
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  /*textfield 4
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
                            child: TextField(
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline_rounded),
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
                              obscureText: isHidden2,
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    color: Color.fromRGBO(155, 155, 155, 1),
                                    onPressed: () {
                                      setState(() {
                                        isHidden2 = !isHidden2;
                                      });
                                    },
                                    icon: Icon(isHidden2 == true
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff1c6758))),
                                hintStyle: GoogleFonts.urbanist(fontSize: font),
                                hintText: 'Confirm Password',
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
                            Navigator.push(
                                context,
                                (MaterialPageRoute(
                                    builder: (context) =>
                                        const create_profile())));
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
