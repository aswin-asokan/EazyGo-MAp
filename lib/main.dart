import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eazygo_map/User/login_page.dart';
import 'package:eazygo_map/auth_prov.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Profile/SourceScreen/Variables.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) => context.watch<AuthProvider>().stream(),
            initialData: null),
        ChangeNotifierProvider(
            create: (context) => ReportProvider(),)
      ],
      child: MaterialApp(
          home: AnimatedSplashScreen(
        splash: 'images/logo.png',
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: double.maxFinite,
        centered: true,
        nextScreen: login_page(),
        duration: 2000,
      )),
    );
  }
}
