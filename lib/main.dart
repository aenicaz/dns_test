import 'package:flutter/material.dart';

import 'pages/HomePage.dart';
import 'pages/SecondPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/SecondPage': (context) => SecondPage(),
      },
    );
  }
}
/*
home: HomePage(),*/
