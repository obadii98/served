import 'package:flutter/material.dart';
import 'UserBoard.dart';
import 'package:served/Resource.dart';

class UserSearch extends StatefulWidget {
  @override
  _UserSearchState createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {

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
