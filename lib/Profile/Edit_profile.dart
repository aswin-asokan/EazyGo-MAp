// import 'package:eazygo_prof/screens/profilePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../SourceScreen/Variables.dart';
// import '../SourceScreen/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazygo_map/Profile/profilePage.dart';
import 'package:eazygo_map/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SourceScreen/Variables.dart';
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
    return Scaffold(
      body: SafeArea(
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
            /*textField(
                svgPath: "images/svg/F_icon.svg",
                hintText: "Full name",
                controller: testcon),
            SizedBox(
              height: 10,
            ),*/
            textField(
                svgPath: "images/svg/L_name.svg",
                hintText: "Location",
                controller: l),
            SizedBox(
              height: 10,
            ),
            /*
            textField(
                svgPath: "images/svg/number.svg",
                hintText: "Phone Number",
                controller: testcon),
            SizedBox(
              height: 10,
            ),*/
            textField1(
                svgPath: "images/svg/emailicon.svg",
                hintText: "Email ID",
                controller: p),

            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                onPressed: () async {
                  String userB = un.text;
                  String locater = l.text;
                  if (userB.isNotEmpty && locater.isNotEmpty) {
                    FirebaseFirestore.instance
                        .collection('my_collection')
                        .doc()
                        .update({
                          'Name': userB,
                          'Location': locater,
                        })
                        .then((value) => Navigator.pop(context))
                        .catchError((error) =>
                            print('Failed to update document: $error'));
                  }
                },
                child: Text("data")),
            MyButton(Title: "submit", onPress: () async {})
          ],
        ),
      )),
    );
  }
}
