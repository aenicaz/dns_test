import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/bloc/home_page_text_data_cubit.dart';
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
        '/' : (context) => BlocProvider.value(
            value: HomePageTextDataCubit(),
            child: HomePage(),
        ),
        '/SecondPage': (context) => SecondPage(),
      },
    );
  }
}