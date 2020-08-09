import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Resource.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String _type = "Type*";
  String _major = "Major";
  String _expDate = "Expiration Date";
  String _from = "From";
  String _to = "To";

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        color: Resource.secondColor,
        height: _height,
        width: _width,
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage("images/profilepic.jpg"))),
                    height: 52,
                    width: 52,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text("Obada Baqleh",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                      new Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 15.0,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "add your price*",
                                hintStyle: TextStyle(fontSize: 14.0)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            new TextField(
              maxLines: 8,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 18.0),
                  hintText: "What do you need?*",
                  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
            ),
            new TextField(
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 18.0),
                  hintText: "Add a title*",
                  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
            ),
            new TextField(
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 18.0),
                  hintText: "#exchange_money , #travling , ...",
                  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
            ),
            new Container(
              width: _width,
              padding: EdgeInsets.only(left: 5.0),
              child: Text(
                "more majors would help do the service faster",
                style: TextStyle(fontSize: 13.0),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
