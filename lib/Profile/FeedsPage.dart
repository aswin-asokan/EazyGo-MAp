// import 'package:eazygo_prof/SourceScreen/Variables.dart';
// import 'package:eazygo_prof/screens/profilePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// import '../SourceScreen/widgets.dart';

import 'package:eazygo_map/Profile/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SourceScreen/Variables.dart';
import 'SourceScreen/widgets.dart';

class feedsPage extends StatefulWidget {
  const feedsPage({super.key});

  @override
  State<feedsPage> createState() => _feedsPageState();
}

class _feedsPageState extends State<feedsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            Title_m(Title: "Feeds", context: context, Page: profilePage()),
            Image.asset("images/noPage.png"),
            Text(
              "This page is Currently unavailable",
              style: TextStyle(fontSize: 20, color: mainColor),
            ),
            Text(
              "we are working on it to make available for you",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            )
          ],
        ),
      )),
    );
  }
}
