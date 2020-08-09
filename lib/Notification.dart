import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:served/Resource.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {

    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Container(
      color: Resource.secondColor,
      width: _width,
      height: _height,
    );
  }
}
