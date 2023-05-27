import 'package:eazygo_map/Profile/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'SourceScreen/Variables.dart';
import 'SourceScreen/widgets.dart';

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: [
            Title_m(Title: "Need Help", context: context, Page: profilePage()),
            Image.asset(
              "images/5236.jpg",
              height: 250,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If you are having any type of trouble while using the app visit our site to learn more about it.",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.link,
                      color: mainColor,
                      size: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          String url =
                              'https://aswin-asokan.github.io/EazyGo-MAp/';
                          launchUrlString(url);
                        },
                        child: Text("Click here to visit our site",
                            style:
                                TextStyle(fontSize: 15, color: Colors.grey))),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
