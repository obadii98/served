import 'package:flutter/material.dart';
import 'package:served/Guestpage.dart';
import 'package:served/ShowProfile.dart';
import 'package:served/Resource.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Resource.secondColor,
      appBar: AppBar(
        backgroundColor: Resource.primaryColor,
        title: Text("Served",
            style: new TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                letterSpacing: 3.5,
                fontFamily: 'Caveat')),
      ),
      body: Container(
        child: Card(
            margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
            elevation: 1.5,
            child: Column(
              children: <Widget>[
                new Container(
                    width: _width,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowProfile()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.fromLTRB(
                                    10.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new AssetImage(
                                              "images/ali.jpg"))),
                                  height: 52,
                                  width: 52,
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.fromLTRB(
                                    5.0, 10.0, 0.0, 0.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text("Ali Issa",
                                        style: Resource.titTextStyle),
                                    new Text("100 points",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Resource.primaryColor))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          new IconButton(
                              icon: Icon(Icons.more_vert, size: 18),
                              onPressed: () {
                              })
                        ],
                      ),
                    )),
                new Container(
                  child: Column(
                    children: <Widget>[
                      new GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 20.0, 0.0, 0.0),
                              child: Text(
                                "Sending document from syria",
                                style: Resource.titTextStyle,
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Container(
                                width: _width,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      5.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    "This is the description its very long it have unlimited lines, and it can be null, depends on the user, before seemore it have only 3 line max,This is the description its very long it have unlimited lines, and it can be null, depends on the user, before seemore it have only 3 line max",
                                    style: Resource.desTextStyle,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                          });
                        },
                      ),
                      new Padding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          child: Container(
                            width: _width,
                            height: 40,
                            child: Row(
                              children: <Widget>[
                                new Container(
                                  height: 40,
                                  width: _width * (50 / 100),
                                  child: FlatButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Padding(
                                              padding: EdgeInsets.only(right: 5.0),
                                              child: Icon(Icons.share)
                                          ),
                                          new Text("Share via")
                                        ],
                                      )),
                                ),
                                new Container(
                                  height: 40,
                                  width: _width * (50 / 100),
                                  child: FlatButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Padding(
                                              padding: EdgeInsets.only(right: 5.0),
                                              child: Icon(Icons.work)
                                          ),
                                          new Text("Propose")
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
