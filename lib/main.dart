import 'package:eazygo_map/navbar.dart';
import 'package:flutter/material.dart';
import 'package:eazygo_map/User/loging.dart';
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Loging());
  }
}
