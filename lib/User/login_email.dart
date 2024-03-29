import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazygo_map/User/login_phone.dart';
import 'package:eazygo_map/User/passwordreset.dart';
import 'package:eazygo_map/Map/map.dart';
import 'package:eazygo_map/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'create_acc.dart';

class login_email extends StatefulWidget {
  const login_email({super.key});

  @override
  State<login_email> createState() => _login_emailState();
}

class _login_emailState extends State<login_email> {
  var isHidden = true;
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    setState(() {
      _isLoggedIn = isLoggedIn;
      provider = prefs.getString('provider')!;

      userName = prefs.getString('userName')!;

      img = prefs.getString('img')!;

      location = prefs.getString('location')!;
    });
    if (email != null && password != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                "Loading......",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              content: Container(
                width: 80.0,
                height: 80.0,
                child: const Center(
                  child: CircularProgressIndicator(
                    value: null,
                    strokeWidth: 2.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            );
          });
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => const Map())));
      });
    }
  }

  void _login() async {
    final email = _email.text;
    provider = _email.text;
    final password = _pass.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('isLoggedIn', true);

    setState(() {
      _isLoggedIn = true;
    });
    String? e;
    QuerySnapshot s = await FirebaseFirestore.instance
        .collection('USERS')
        .where('provider', isEqualTo: provider)
        .get();
    if (s.docs.isNotEmpty) {
      for (var doc in s.docs) {
        e = doc['provider'];
      }
    }
    if (e == provider) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => const Map())));
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('USERS')
            .where('provider', isEqualTo: provider)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          for (var doc in querySnapshot.docs) {
            location = doc['Location'];
            print('loc:' + location!);
            userName = doc['Name'];
            img = doc['image'];
            provider = doc['provider'];
            await prefs.setString('location', location!);
            await prefs.setString('userName', userName!);
            await prefs.setString('img', img);
            await prefs.setString('provider', provider!);
          }
        } else {
          print('No document found with email: $provider');
        }
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Email or Password Incorrect'),
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xff1c6758),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Register to login'),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xff1c6758),
      ));
    }
  }

  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                                  builder: (context) => login_phone())));
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
              height: size1,
            ),
            /*Text field 1
            starts
            here*/
            SingleChildScrollView(
              child: Column(
                children: [
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
                                prefixIcon: Icon(
                                  Icons.alternate_email_rounded,
                                  size: font,
                                ),
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
                              controller: _email,
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
                    height: height * 0.02,
                  ),
                  /*textfield 2
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
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  size: font,
                                ),
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
                              controller: _pass,
                              obscureText: isHidden,
                              cursorColor: Color.fromRGBO(28, 103, 88, 1),
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    color: Color.fromRGBO(155, 155, 155, 1),
                                    onPressed: () {
                                      setState(() {
                                        isHidden = !isHidden;
                                      });
                                    },
                                    icon: Icon(isHidden == true
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
                  Padding(
                    padding: const EdgeInsets.only(left: 58),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              (MaterialPageRoute(
                                  builder: (context) => const password())));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.urbanist(
                              fontSize: font,
                              color: Color.fromRGBO(28, 103, 88, 1)),
                        ),
                      ),
                    ),
                  )
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
                            _login();
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xff1c6758))),
                          child: Text(
                            'Login',
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
                                      builder: (context) =>
                                          const create_acc())));
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
      ),
    );
  }
}
