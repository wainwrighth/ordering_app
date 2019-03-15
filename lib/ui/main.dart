import 'package:flutter/material.dart';

import 'package:ordering_app/ui/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Ordering App',
      theme: ThemeData(
        primaryColor: Colors.white,//Color(0xFFED1B24),
      ),
      home: MyHomePage(),
    );
  }
}