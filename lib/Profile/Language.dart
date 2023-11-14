// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../SourceScreen/widgets.dart';
// import 'Settings.dart';

import 'package:eazygo_map/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Settings.dart';
import 'SourceScreen/widgets.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c1,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Column(children: [
            Title_m(Title: "Language", context: context, Page: SettingaPage()),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "images/language.png",
              height: 230,
              width: 230,
            ),
            SizedBox(
              height: 30,
            ),
            card_Checkbox(
              line_visible: true,
              title: "English",
              svgPath: "images/svg/Engligh_icon.svg",
              isActive: true,
              notice: "",
            ),
            card_Checkbox(
              title: "Hindi",
              svgPath: "images/svg/Hindi_icon.svg",
              isActive: false,
              line_visible: false,
              notice: "(Currently only Hindi is unavailable)",
            ),
          ]),
        ),
      ),
    );
  }
}
