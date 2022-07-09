// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void printError(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    margin: EdgeInsets.all(15),
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 3),
  ));
}

void printSuccess(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    margin: EdgeInsets.all(15),
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 3),
  ));
}