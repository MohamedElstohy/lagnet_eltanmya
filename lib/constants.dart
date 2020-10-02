import 'package:flutter/material.dart';

double getDeviceHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double getDeviceWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

TextStyle kTitleTextStyle(){
  return TextStyle(
    color: Color(0xFF0A0A0A),
    fontSize: 18,
    fontWeight: FontWeight.bold
  );
}

TextStyle kMoreTitleTextStyle(){
  return TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF000000)
  );
}