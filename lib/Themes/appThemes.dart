// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red,
    ),
    textTheme: _lightTextStyle,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
  static final TextTheme _lightTextStyle = TextTheme(
    headline1: _mainHead,
    headline2: _subHead,
    bodyText1: _labelText,
    bodyText2: _buttonText,
  );
  static final TextStyle _mainHead = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static final TextStyle _subHead = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      letterSpacing: 1);
  static final TextStyle _labelText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.grey[800],
  );
  static final TextStyle _buttonText = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}
