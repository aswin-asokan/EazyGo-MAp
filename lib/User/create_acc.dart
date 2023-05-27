import 'package:eazygo_map/Profile/ContactUs.dart';
import 'package:eazygo_map/User/create_profile.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'create_accPhn.dart';
import '../variables.dart';

class create_acc extends StatefulWidget {
  const create_acc({super.key});

  @override
  State<create_acc> createState() => _create_accState();
}

class _create_accState extends State<create_acc> {
  final TextEditingController mail = TextEditingController();
  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();

  var errormessage = "";
  bool _isvisible = false;

  @override
  var isHidden1 = true;
  var isHidden2 = true;
  Widget build(BuildContext context) {
    void dispose() {
      mail.dispose();
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

            /*image
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
                                  builder: (context) => create_accPhn())));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            foregroundColor: Colors.black),
                        child: Text(
                          'Phone Number',
                          style: GoogleFonts.urbanist(
                              fontSize: font, fontWeight: FontWeight.w400),
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
                            child: TextFormField(
                              controller: mail,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (mail) =>
                                  mail != null && !EmailValidator.validate(mail)
                                      ? 'Enter a valid email'
                                      : null,
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
                              controller: pass1,
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
                              controller: pass2,
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
                  if (!isKeyboard)
                    SizedBox(
                      height: height * 0.005,
                    ),
                  Visibility(
                    visible: _isvisible,
                    child: Text(
                      '$errormessage',
                      style: TextStyle(color: Color.fromARGB(255, 218, 8, 8)),
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
                            provider = mail.text;
                            if (pass1.text.isEmpty ||
                                mail.text.isEmpty ||
                                pass2.text.isEmpty) {
                              /*if (pass1.text != pass2.text) {
                                setState(() {
                                  _isvisible = true;
                                });
                                Future.delayed(const Duration(seconds: 2), () {
                                  setState(() {
                                    _isvisible = false;
                                  });
                                });

                                errormessage = "Password Doesn't Match";
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Email is already Registered'),
                                    duration: Duration(seconds: 2),
                                    backgroundColor: Color(0xff1c6758),
                                  ),
                                );
                              } else {
                                setState(() {
                                  _isvisible = true;
                                });
                                Future.delayed(const Duration(seconds: 2), () {
                                  setState(() {
                                    _isvisible = false;
                                  });
                                });

                                errormessage = "Email Or Password is Empty";
                              }*/
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Email or Password field is Empty'),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xff1c6758),
                                ),
                              );
                            } else if (pass1.text != pass2.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Password doesn\'t match'),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xff1c6758),
                                ),
                              );
                            } else if (pass1.text.isNotEmpty ==
                                pass2.text.isNotEmpty) {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: mail.text, password: pass2.text)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Registered successfully"),
                                    duration: Duration(seconds: 2),
                                    backgroundColor: Color(0xff1c6758),
                                  ),
                                );
                                Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                        builder: (context) =>
                                            create_profile())));
                              }).onError((error, stackTrace) {
                                print("Error SignUp:${error.toString()}");
                                if (error is FirebaseAuthException) {
                                  if (error.code == 'email-already-in-use') {
                                    // Email is already in use by another account
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Email is already Registered'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Color(0xff1c6758),
                                      ),
                                    );
                                  }
                                }
                              });
                            }

                            setState(() {
                              mail.clear();
                              pass1.clear();
                              pass2.clear();
                            });
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
