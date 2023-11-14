// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../SourceScreen/widgets.dart';
// import 'Settings.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

import '../variables.dart';
import 'Settings.dart';
import 'SourceScreen/widgets.dart';

class TheamPage extends StatefulWidget {
  const TheamPage({super.key});

  @override
  State<TheamPage> createState() => _TheamPageState();
}

class _TheamPageState extends State<TheamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c1,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Title_m(Title: "Theme", context: context, Page: SettingaPage()),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "images/theme.png",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 40,
            ),
            card_Checkbox(
              line_visible: true,
              title: "Lightmode",
              svgPath: "images/svg/Light_icon.svg",
              isActive: true,
              notice: "",
            ),
            card_Checkbox(
              line_visible: false,
              title: "Darkmode",
              svgPath: "images/svg/Dark_icon.svg",
              isActive: false,
              notice: "(darkmode is unavailable)",
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    c1 = Colors.black;
                    c2 = Color.fromRGBO(217, 233, 230, 1);
                    c3 = Colors.white;
                  });
                },
                child: Text('dark mode')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    c1 = Colors.white;
                    c2 = Color(0xff1c6758);
                    c3 = Color(0xff686868);
                  });
                },
                child: Text('light mode'))
          ],
        ),
      )),
    );
  }
}
