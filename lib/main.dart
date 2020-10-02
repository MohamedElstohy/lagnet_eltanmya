import 'package:flutter/material.dart';
import 'views/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'لجنة التنمية',
      theme: ThemeData(
        fontFamily: 'Cairo',
        accentColor: Color.fromRGBO(86, 104, 92,1),//
        primaryColor: Color.fromRGBO(233, 221, 201,1), // Color(0xFFF2F2F2)
        backgroundColor: Color.fromRGBO(242, 242, 242,1),
        canvasColor: Colors.transparent,
      ),
      home: SplashView(),
    );
  }
}


