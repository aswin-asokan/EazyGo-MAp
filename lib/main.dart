import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eazygo_map/navbar.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnimatedSplashScreen(
      splash: 'images/logo.png',
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: double.maxFinite,
      centered: true,
      nextScreen: Login(),
      duration: 2000,
    ));
  }
}
