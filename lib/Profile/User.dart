
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../SourceScreen/widgets.dart';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SourceScreen/widgets.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Profie"),
            profile(),
          ],
        ),
      )),
    );
  }
}
