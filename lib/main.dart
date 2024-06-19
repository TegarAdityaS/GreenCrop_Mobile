import 'package:flutter/material.dart';
import 'package:ui_13/page/splash_page2.dart';
import 'package:ui_13/coba/coba_login.dart';
import 'page/splash_page.dart';
import 'package:ui_13/widgets/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Growharvestapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Gilroy',
      ),
      home: LoginPage(),
      routes: {
        '/bottom_nav': (context) => BottomNavBar(),
      },
    );
  }
}
