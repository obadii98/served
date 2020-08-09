import 'package:flutter/material.dart';

class Resource {
  static Color primaryColor = Colors.blueGrey[500];
  static Color secondColor = Colors.blueGrey[50];
  static Color darkSecColor = Colors.blueGrey[100];
  static Color activePrimColor = Colors.blue[700];
  static bool isDraged = false;
  static TextStyle urlTextStyle = TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 14.0,
      fontStyle: FontStyle.italic,
      color: Colors.blue[700],
      decoration: TextDecoration.underline);
  static TextStyle desTextStyle = TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 14.0,
  );
  static TextStyle badgeDesTextStyle = TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 12.0,
    textBaseline: TextBaseline.alphabetic
  );
  static TextStyle costTextStyle = TextStyle(
    fontSize: 12.0,
    color: Colors.blue[700]
  );
  static TextStyle titTextStyle = TextStyle(
      fontFamily: 'Merriweather', fontSize: 16.0, fontWeight: FontWeight.bold);
  static TextStyle hashTextStyle = TextStyle(
      fontFamily: 'Merriweather', fontSize: 14.0, fontStyle: FontStyle.italic);
}
