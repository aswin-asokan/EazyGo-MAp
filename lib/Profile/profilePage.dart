import 'package:eazygo_map/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eazygo_map/variables.dart';
import 'ContactUs.dart';
import 'Edit_profile.dart';
import 'FeedsPage.dart';
import 'Settings.dart';
import 'SourceScreen/Variables.dart';
import 'SourceScreen/widgets.dart';
import 'Your_report.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Title_m(
              Title: "Profile",
              arrow_visible: false,
            ),
            Container(height: 180, width: 180, child: ProfilePic()),
            UserName(usernmae: '@$userName'),
            SizedBox(
              height: 15,
            ),
            //countProfile(),
            SizedBox(
              height: 15,
            ),
            profileButton1(
                title: "Edit Profile",
                icon: Icons.edit,
                context: context,
                page: editProfile()),
            SizedBox(
              height: 5,
            ),
            profileButton2(
              title: "Log out",
              icon: Icons.logout,
              context: context,
            ),
            SizedBox(
              height: 20,
            ),
            /*card(
                title: "Reports made by you",
                svgPath: "images/svg/reportIcon.svg",
                context: context,
                page: YourReport()),
            card(
                title: "Feeds Posted",
                svgPath: "images/svg/FeedsIcon.svg",
                context: context,
                page: const feedsPage()),*/
            card(
                title: "Settings",
                svgPath: "images/svg/SettingsIcon.svg",
                context: context,
                page: SettingaPage()),
            card(title: "Help", svgPath: "images/svg/HelpIcon.svg"),
            card(
                title: "Contact Us",
                svgPath: "images/svg/ContactIcon.svg",
                context: context,
                page: contactPage(),
                line_visible: false),
          ],
        ),
      )),
    );
  }
}
