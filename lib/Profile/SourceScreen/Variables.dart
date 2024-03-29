import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../../User/login_page.dart';
import '../../variables.dart';

Color mainColor = Color(0xff1C6758);
Future<void> navigateTo(BuildContext context, var Page) async {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (ctx) => Page),
  );
}

Future<void> PopTo(BuildContext context, var Page) async {
  Navigator.of(context).pop(MaterialPageRoute(builder: (ctx) => Page));
  //Navigator.of(context).pushAndRemoveUntil(
  //   MaterialPageRoute(builder: (context) => Page), (route) => false);
}

TextEditingController locate = TextEditingController();
TextEditingController provide = TextEditingController();
TextEditingController uname = TextEditingController();

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

File? imagePermanent;
//File? image_d = File('images/noProfile.png');

var feedsCount = 140;
var reportCount = 100;

var uName = userName;

class ReportProvider with ChangeNotifier {
  List report_list = [];
  addTodo() {
    report_list.add(Widget);
  }

  void removeItem(int index) {
    report_list.removeAt(index);
    notifyListeners();
  }
}

class Report {
  late String title;
  late String icon;
  late String desc;
  late String loc;
  late String type;

  Report({Title, icon, desc, loc, type});
}

class MyListWidget extends StatefulWidget {
  final List<String> items;

  const MyListWidget({Key? key, required this.items}) : super(key: key);

  @override
  _MyListWidgetState createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = widget.items[index];

        return Dismissible(
          key: Key(item),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              widget.items.removeAt(index);
            });

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('$item removed from list'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  setState(() {
                    widget.items.insert(index, item);
                  });
                },
              ),
            ));
          },
          background: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20.0),
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: ListTile(
            title: Text(item),
          ),
        );
      },
    );
  }
}
