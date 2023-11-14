// import 'package:eazygo_prof/screens/profilePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/svg.dart';

// import '../SourceScreen/widgets.dart';
// import 'Default_location.dart';
// import 'Language.dart';
// import 'T&C.dart';
// import 'Theme.dart';

import 'package:eazygo_map/Profile/profilePage.dart';
import 'package:eazygo_map/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Default_location.dart';
import 'Language.dart';
import 'SourceScreen/widgets.dart';
import 'T&C.dart';
import 'Theme.dart';

class SettingaPage extends StatefulWidget {
  const SettingaPage({super.key});

  @override
  State<SettingaPage> createState() => _SettingaPageState();
}

class _SettingaPageState extends State<SettingaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c1,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Title_m(Title: "Settings", context: context, Page: profilePage()),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 200,
                width: 200,
                child: Image.asset("images/Asset 1.png")),
            SizedBox(
              height: 50,
            ),
            card(
                title: "Language",
                svgPath: "images/svg/LanguageIcon.svg",
                context: context,
                page: LanguagePage()),
            SizedBox(
              height: 10,
            ),
            card(
                title: "Theme",
                svgPath: "images/svg/ThemeIcon.svg",
                context: context,
                page: TheamPage()),
            SizedBox(
              height: 10,
            ),
            /*card(
                title: "Default Location",
                svgPath: "images/svg/DefaultIcon.svg",
                context: context,
                page: DefaultLocation()),
            SizedBox(
              height: 10,
            ),*/
            card(
                title: "Terms and Conditions",
                svgPath: "images/svg/T&CIcon.svg",
                context: context,
                page: termsAndConditions()),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
