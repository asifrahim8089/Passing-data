// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

void showFlushBar(
    {@required title,
    @required message,
    @required icon,
    @required context,
    @required color,
    Duration? duration}) {
  var flush = Flushbar(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    margin: EdgeInsets.all(30),
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: color,
    duration: Duration(seconds: 2),
    icon: Icon(
      icon,
      color: Colors.white,
    ),
    titleText: Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(
      message,
      style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
  )..show(context);
}
