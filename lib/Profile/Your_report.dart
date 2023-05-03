// import 'package:eazygo_prof/SourceScreen/Variables.dart';
// import 'package:eazygo_prof/screens/profilePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';

// import '../SourceScreen/widgets.dart';

import 'package:eazygo_map/Profile/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SourceScreen/Variables.dart';
import 'SourceScreen/widgets.dart';

class YourReport extends StatefulWidget {
  const YourReport({super.key});

  @override
  State<YourReport> createState() => _YourReportState();
}

class _YourReportState extends State<YourReport> {
  @override
  Widget build(BuildContext context) {
    ReportProvider Reportpro = Provider.of<ReportProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 30,
            left: 5,
            right: 5,
          ),
          child: Column(children: [
            Title_m(
                Title: "Your Reports", context: context, Page: profilePage()),
            //  Expanded(
            //    child: ListView.builder(
            //             itemCount: Reportpro.report_list.length,
            //             itemBuilder: ((context, index) => ReportCard())),
            //  ),

            Expanded(
              flex: 9,
              child: ListView.separated(
                itemCount: Reportpro.report_list.length,
                itemBuilder: (context, index) {
                  var report = Reportpro.report_list[index];
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red.withOpacity(.5),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        Reportpro.removeItem(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Report removed from list'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            setState(() {
                              Reportpro.addTodo();
                            });
                          },
                        ),
                      ));
                    },
                    child: ReportCard(),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15),
              ),
            ),
            Expanded(
                flex: 1,
                child: TextField(
                  controller: uname,
                ))
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Reportpro.addTodo();
            // testT="hell";
          }); // call the function to add a new widget
        },
        child: Icon(Icons.add),
      ),
    );
  }
}






// import 'package:flutter/material.dart';

// class DynamicListWidget extends StatefulWidget {
//   @override
//   _DynamicListWidgetState createState() => _DynamicListWidgetState();
// }

// class _DynamicListWidgetState extends State<DynamicListWidget> {
//   List<Widget> _myList = []; // create an empty list of widgets

//   // function to add a new widget to the list
//   void addWidget() {
//     setState(() {
//       _myList.add(reportCard()); // add the new widget to the list
//     });
//   }

//   // function to build a new widget with a title, content, and icon

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Widget'),
//       ),
//       body: ListView.builder(
//         itemCount: _myList.length,
//         itemBuilder: (context, index) {
//           return _myList[index];
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _myList.add(
//               reportCard(
//                 Title: 'My Title',
//                 icon: Icons.ac_unit,
//                 desc: 'My Description',
//                 loc: 'My Location',
//                 type: 'others',
//               ),
//             );
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }