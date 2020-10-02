import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lagnet_eltanmyaa/views/home.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      (){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context) => HomeView()
          )
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      body: Center(
        child: Container(
          width: 250,
          height: 220,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash@3x.png'),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}