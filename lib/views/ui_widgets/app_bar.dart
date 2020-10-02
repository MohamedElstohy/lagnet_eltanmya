import 'package:flutter/material.dart';

Widget customAppBar({BuildContext context , String title ,List<Widget> actions}){
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF000000)
      ),
    ),
    leading: IconButton(
      icon: Image.asset(
        'assets/images/back.png',
        width: 32,
        height: 32,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    actions: actions ?? actions,
    automaticallyImplyLeading: false,
    centerTitle: false,
    backgroundColor: Theme.of(context).backgroundColor,
    elevation: 0.0,
  );
}