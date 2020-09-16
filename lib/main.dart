import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/second_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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