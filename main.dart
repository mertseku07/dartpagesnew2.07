import 'package:untitled/homepage.dart';
import 'package:untitled/login_page.dart';
import 'package:flutter/material.dart';
import 'package:untitled/profile.dart';
import 'package:untitled/schedule.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      "/": (context) => LoginPage(),
      "/homepage": (context) => HomePage(),
      "/profile": (context) => Profile(),
      "/schedule" : (context) => Schedule(),
      "/logout" : (context) => LoginPage(),
    });
  }
}
