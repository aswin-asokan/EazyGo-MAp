import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazygo_map/Profile/profilePage.dart';
import 'package:eazygo_map/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../User/login_page.dart';
import 'SourceScreen/widgets.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

final CollectionReference _users =
    FirebaseFirestore.instance.collection('USERS');

class _editProfileState extends State<editProfile> {
  TextEditingController un = TextEditingController(text: userName);
  TextEditingController p = TextEditingController(text: provider);
  TextEditingController l = TextEditingController(text: location);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: c1,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Title_m(
                  Title: "Edit Profile", context: context, Page: profilePage()),
              // SizedBox(
              //   height: 20,
              // ),
              Container(height: 200, width: 200, child: profile()),
              textField(
                  svgPath: "images/svg/UserIcon.svg",
                  hintText: "username",
                  controller: un),
              SizedBox(
                height: 10,
              ),
              textField(
                  svgPath: "images/svg/L_name.svg",
                  hintText: "Location",
                  controller: l),
              SizedBox(
                height: 10,
              ),
              textField1(
                  svgPath: "images/svg/emailicon.svg",
                  hintText: "Email ID",
                  controller: p),
              SizedBox(
                height: 60,
              ),
              Container(
                height: height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      String uname = un.text;
                      String loc = l.text;
                      String? docId;
                      QuerySnapshot querySnapshot = await FirebaseFirestore
                          .instance
                          .collection('USERS')
                          .where('provider', isEqualTo: provider)
                          .get();
                      querySnapshot.docs.forEach((document) {
                        docId = document.id;
                        print(docId);
                      });
                      DocumentReference documentReference = FirebaseFirestore
                          .instance
                          .collection('USERS')
                          .doc(docId);
                      await documentReference.update(
                          {'Name': uname, 'Location': loc, 'image': img});
                      setState(() async {
                        userName = uname;
                        location = loc;
                        print(userName);
                      });
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('location', location!);
                      await prefs.setString('userName', userName!);
                      await prefs.setString('img', img);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Edits Saved',
                          style: GoogleFonts.urbanist(),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Color(0xff1c6758),
                      ));
                      setState(() {});
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xff1c6758))),
                    child: Text(
                      'Save Changes',
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
                height: height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color.fromRGBO(217, 233, 230, 1),
                              title: Text('Delete Account',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.bold)),
                              content: Text(
                                'You are about to delete your account.Are you Sure',
                                style: GoogleFonts.urbanist(),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          await prefs.remove('email');
                                          await prefs.remove('password');
                                          await prefs.remove('phoneNumber');
                                          await prefs.remove('verificationId');
                                          await prefs.remove('location');
                                          await prefs.remove('userName');
                                          await prefs.remove('img');
                                          await prefs.remove('provider');
                                          final FirebaseAuth _auth =
                                              FirebaseAuth.instance;
                                          User user = _auth.currentUser!;
                                          await user.delete();
                                          Navigator.pushReplacement(
                                              context,
                                              (MaterialPageRoute(
                                                  builder: (context) =>
                                                      login_page())));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                'Account Deleted Successfully',
                                                style: GoogleFonts.urbanist()),
                                            duration: Duration(seconds: 2),
                                            backgroundColor: Colors.red,
                                          ));
                                        },
                                        child: Text('Yes',
                                            style: GoogleFonts.urbanist(
                                                color: Colors.red))),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancel',
                                            style: GoogleFonts.urbanist()))
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.redAccent)),
                    child: Text(
                      'Delete Account',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
