//import 'package:eazygo_profile/Screens/Settings.dart';
// import 'package:eazygo_prof/screens/profilePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../SourceScreen/Variables.dart';
// import '../SourceScreen/widgets.dart';
// import 'Settings.dart';



//import 'package:eazygo_profile/SourceScreen/widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Settings.dart';
import 'SourceScreen/Variables.dart';
import 'SourceScreen/widgets.dart';

class DefaultLocation extends StatefulWidget {
  const DefaultLocation({super.key});

  @override
  State<DefaultLocation> createState() => _DefaultLocationState();
}

class _DefaultLocationState extends State<DefaultLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        padding: EdgeInsets.only(top: 30,left: 10,right: 10),
        child: Column(
          children: [
            Title_m(Title: "Default Location",context: context,Page: SettingaPage()),
            Image.asset("images/noPage.png",height: 300,width: 300,),
            SizedBox(height: 20,),
            Text("This page is Currently unavailable",style: TextStyle(
              fontSize: 20,
              color: mainColor
            ),),
            Text("we are working on it to make available for you",style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),)
          ],
        ),
      )),
    );
  }
}
