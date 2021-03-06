import 'package:flutter/material.dart';

Color primaryColor = Color(0xFF39ad89);
Color scaffoldBackgroundColor = Color(0xFFF1F1F1);
Color textColor = Color(0xFF333333);
Color textColorWhite = Colors.white;
Color searchBarTextColor = Colors.grey[300];

TextStyle linkTextStyle = TextStyle(
    color: textColor,
    letterSpacing: 0.9,
    fontSize: 12.0,
    decoration: TextDecoration.underline,
    decorationColor: textColor,
    fontFamily: 'Merriweather');

TextStyle defaultTextStyle = TextStyle(
    color: textColor,
    letterSpacing: 0.8,
    decoration: TextDecoration.none,
    fontSize: 18.0,
    fontFamily: 'Merriweather');

TextStyle searchBarTextStyle = TextStyle(
    color: searchBarTextColor,
    letterSpacing: 0.8,
    fontSize: 14.0,
    fontFamily: 'Merriweather');

TextStyle defaultBoldTextStyle = TextStyle(
    color: textColor,
    letterSpacing: 1.2,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Merriweather');

TextStyle inputHintTextStyle = TextStyle(
    color: searchBarTextColor,
    letterSpacing: 0.8,
    decoration: TextDecoration.none,
    fontSize: 14.0,
    fontFamily: 'Merriweather');

TextStyle inputTextStyle = TextStyle(
    color: textColorWhite,
    letterSpacing: 0.8,
    fontSize: 14.0,
    fontFamily: 'Merriweather');
