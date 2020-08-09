import 'package:flutter/material.dart';
import 'package:served/MyFullPosts.dart';
import 'package:served/ShowProposals.dart';
import 'package:served/Resource.dart';
import 'package:served/Profile.dart';
import 'package:served/UserBoard.dart';


class MyPosts extends StatefulWidget {
  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {

  bool _ispreesed;
  bool _isreport;
  ScrollController _scrollCont;

  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    if (_isreport == false)
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new FlatButton(
                            onPressed: () {
                              setState(() {
                                _isreport = true;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                new Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text("Hide",
                                      style: TextStyle(color: Colors.black)),
                                )
                              ],
                            )),
                        new FlatButton(
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                new Icon(
                                  Icons.watch_later,
                                  color: Colors.grey,
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text("Save Post",
                                      style: TextStyle(color: Colors.black)),
                                )
                              ],
                            )),
                      ],
                    )));
          });
    else
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("else"),
            );
          });
  }

  @override
  void initState() {
    _ispreesed = false;
    _isreport = false;
    _scrollCont = ScrollController();
    _scrollCont.addListener(_scrollListener);
  }


  _scrollListener() {
    if (_scrollCont.offset >= _scrollCont.position.minScrollExtent) {
      Navigator.push(context, PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimatio){
            return MyFullPosts();
          }));
      setState(() {
        print("reach the top");
        Resource.isDraged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery
        .of(context)
        .size
        .height;
    var _width = MediaQuery
        .of(context)
        .size
        .width;

    if (_ispreesed == false)
      return Container(
        color: Resource.secondColor,
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification)
              setState(() {
//                Navigator.of(context)
//                    .push(MaterialPageRoute(builder: (context) => UserBoard()));
              });
            return;
          },
          child: ListView(
            controller: _scrollCont,
            children: <Widget>[
              Card(
                  margin: EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
                  elevation: 1.5,
                  child: Column(
                    children: <Widget>[
                      new Container(
                          width: _width,
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
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
                                                    "images/profilepic.jpg"))),
                                        height: 52,
                                        width: 52,
                                      ),
                                    ),
                                    new Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Row(
                                            children: <Widget>[
                                              new Text("Obada Baqleh",
                                                  style: Resource.titTextStyle),
                                              new Padding(
                                                padding: EdgeInsets.only(
                                                    left: 5.0),
                                                child: Text("20/10/2020",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Resource
                                                            .primaryColor)),
                                              )
                                            ],
                                          ),
                                          new Text("100 points",
                                              style: Resource.costTextStyle)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      new Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            new GestureDetector(
                              onTap: () {
                                setState(() {
                                  _ispreesed = true;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 0.0, 0.0, 0.0),
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
                            ),
                            new Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Container(
                                  width: _width,
                                  height: 40,
                                  child: Row(
                                    children: <Widget>[
                                      new Container(
                                        width: _width * (30 / 100),
                                        height: 40,
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.delete, size: 18.0,),
                                                new Text("Delete",
                                                    style: TextStyle(
                                                        fontSize: 12.0))
                                              ],
                                            )),
                                      ),
                                      new Container(
                                        width: _width * (33 / 100),
                                        height: 40,
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.share, size: 18.0,),
                                                new Text("Share via",
                                                    style: TextStyle(
                                                        fontSize: 12.0))
                                              ],
                                            )),
                                      ),
                                      new Container(
                                        width: _width * (37 / 100),
                                        height: 40,
                                        child: FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowProposals()),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.looks, size: 18.0,),
                                                new Text("Show Proposals",
                                                    style: TextStyle(
                                                        fontSize: 12.0))
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
              Card(
                  margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                  elevation: 1.5,
                  child: Column(
                    children: <Widget>[
                      new Container(
                          width: _width,
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
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
                                                    "images/profilepic.jpg"))),
                                        height: 52,
                                        width: 52,
                                      ),
                                    ),
                                    new Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Row(
                                            children: <Widget>[
                                              new Text("Obada Baqleh",
                                                  style: Resource.titTextStyle),
                                              new Padding(
                                                padding: EdgeInsets.only(
                                                    left: 5.0),
                                                child: Text("20/10/2020",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Resource
                                                            .primaryColor)),
                                              )
                                            ],
                                          ),
                                          new Text("100 points",
                                              style: Resource.costTextStyle)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      new Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    "sharing a taxi",
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
                                        "I just want to share a taxi",
                                        style: Resource.desTextStyle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Container(
                                  width: _width,
                                  height: 40,
                                  child: Row(
                                    children: <Widget>[
                                      new Container(
                                        height: 40,
                                        width: _width * (30 / 100),
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.delete, size: 18.0,),
                                                new Text("Delete",
                                                    style: TextStyle(
                                                        fontSize: 12.0))
                                              ],
                                            )),
                                      ),
                                      new Container(
                                        height: 40,
                                        width: _width * (33 / 100),
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.share, size: 18.0,),
                                                new Text("Share via",
                                                    style: TextStyle(
                                                        fontSize: 12.0))
                                              ],
                                            )),
                                      ),
                                      new Container(
                                        height: 40,
                                        width: _width * (37 / 100),
                                        child: FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowProposals()),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.looks, size: 18.0,),
                                                new Text("Show Proposals",
                                                    style: TextStyle(
                                                        fontSize: 12.0))
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
              Card(
                  margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                  elevation: 1.5,
                  child: Column(
                    children: <Widget>[
                      new Container(
                          width: _width,
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
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
                                                    "images/profilepic.jpg"))),
                                        height: 52,
                                        width: 52,
                                      ),
                                    ),
                                    new Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Row(
                                            children: <Widget>[
                                              new Text("Obada Baqleh",
                                                  style: Resource.titTextStyle),
                                              new Padding(
                                                padding: EdgeInsets.only(
                                                    left: 5.0),
                                                child: Text("20/10/2020",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Resource
                                                            .primaryColor)),
                                              )
                                            ],
                                          ),
                                          new Text("100 points",
                                              style: Resource.costTextStyle)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      new Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    "Looking for a roomate",
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
                                        "I'm looking for a female model roomate, must have a double D, nice personality, open minded",
                                        style: Resource.desTextStyle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Container(
                                  width: _width,
                                  height: 40,
                                  child: Row(
                                    children: <Widget>[
                                      new Container(
                                        height: 40,
                                        width: _width * (30 / 100),
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.delete, size: 18.0,),
                                                new Text("Delete",
                                                  style: TextStyle(
                                                      fontSize: 12.0),)
                                              ],
                                            )),
                                      ),
                                      new Container(
                                        height: 40,
                                        width: _width * (33 / 100),
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.share, size: 18.0,),
                                                new Text("Share via",
                                                    style: TextStyle(
                                                        fontSize: 12.0))
                                              ],
                                            )),
                                      ),
                                      new Container(
                                        height: 40,
                                        width: _width * (37 / 100),
                                        child: FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowProposals()),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.looks, size: 18.0,),
                                                new Text("Show Proposals",
                                                    style: TextStyle(
                                                        fontSize: 12.0))
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
            ],
          ),
        ),
      );
    else
      return Container(
        color: Resource.secondColor,
        child: ListView(
          children: <Widget>[
            new Card(
                margin: EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
                elevation: 1.5,
                child: Column(
                  children: <Widget>[
                    new Container(
                        width: _width,
                        child: GestureDetector(
                          onTap: () {},
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
                                                  "images/profilepic.jpg"))),
                                      height: 52,
                                      width: 52,
                                    ),
                                  ),
                                  new Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text("Obada Baqleh",
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
                                    createAlertDialog(context);
                                  })
                            ],
                          ),
                        )),
                    new Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new GestureDetector(
                            onTap: () {
                              setState(() {
                                _ispreesed = false;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 0.0, 0.0, 0.0),
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
                                        maxLines: 99,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 5.0, 0.0, 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      new Padding(
                                        padding:
                                        EdgeInsets.only(right: 5.0),
                                        child: Text(
                                          "#sending_documents",
                                          style: Resource.hashTextStyle,
                                        ),
                                      ),
                                      new Padding(
                                        padding:
                                        EdgeInsets.only(right: 5.0),
                                        child: Text(
                                          "#syria",
                                          style: Resource.hashTextStyle,
                                        ),
                                      ),
                                      new Padding(
                                        padding:
                                        EdgeInsets.only(right: 5.0),
                                        child: Text(
                                          "#jordan",
                                          style: Resource.hashTextStyle,
                                        ),
                                      ),
                                      new Text(
                                        "#points_service",
                                        style: Resource.hashTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Container(
                                width: _width,
                                height: 40,
                                child: Row(
                                  children: <Widget>[
                                    new Container(
                                      height: 40,
                                      width: _width * (30 / 100),
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.delete, size: 18.0,),
                                              new Text("Delete",
                                                style: TextStyle(
                                                    fontSize: 12.0),)
                                            ],
                                          )),
                                    ),
                                    new Container(
                                      height: 40,
                                      width: _width * (33 / 100),
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.share, size: 18.0,),
                                              new Text("Share via",
                                                  style: TextStyle(
                                                      fontSize: 12.0))
                                            ],
                                          )),
                                    ),
                                    new Container(
                                      height: 40,
                                      width: _width * (37 / 100),
                                      child: FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShowProposals()),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.looks, size: 18.0,),
                                              new Text("Show Proposals",
                                                  style: TextStyle(
                                                      fontSize: 12.0))
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
            new Card(
                margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                elevation: 1.5,
                child: Column(
                  children: <Widget>[
                    new Container(
                        width: _width,
                        child: GestureDetector(
                          onTap: () {},
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
                                                  "images/profilepic.jpg"))),
                                      height: 52,
                                      width: 52,
                                    ),
                                  ),
                                  new Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text("Obada Baqleh",
                                            style: Resource.titTextStyle),
                                        new Text("100 USD",
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
                                    createAlertDialog(context);
                                  })
                            ],
                          ),
                        )),
                    new Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new GestureDetector(
                              onTap: () {
                                setState(() {
                                  _ispreesed = true;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "sharing a taxi",
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
                                          "I just want to share a taxi",
                                          style: Resource.desTextStyle,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 5.0, 0.0, 0.0),
                                    child: Column(
                                      children: <Widget>[
                                        new Row(
                                          children: <Widget>[
                                            new Padding(
                                              padding:
                                              EdgeInsets.only(right: 5.0),
                                              child: Text(
                                                "#taxi",
                                                style: Resource.hashTextStyle,
                                              ),
                                            ),
                                            new Padding(
                                              padding:
                                              EdgeInsets.only(right: 5.0),
                                              child: Text(
                                                "#low_budget",
                                                style: Resource.hashTextStyle,
                                              ),
                                            ),
                                            new Padding(
                                              padding:
                                              EdgeInsets.only(right: 5.0),
                                              child: Text(
                                                "#sharing is caring",
                                                style: Resource.hashTextStyle,
                                              ),
                                            ),
                                            new Padding(
                                              padding:
                                              EdgeInsets.only(right: 5.0),
                                              child: Text(
                                                "#taxi2",
                                                style: Resource.hashTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                        new Row(
                                          children: <Widget>[
                                            new Padding(
                                              padding:
                                              EdgeInsets.only(right: 5.0),
                                              child: Text(
                                                "#hashtag",
                                                style: Resource.hashTextStyle,
                                              ),
                                            ),
                                            new Text(
                                              "#empty hashtag",
                                              style: Resource.hashTextStyle,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                          new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Container(
                                width: _width,
                                height: 40,
                                child: Row(
                                  children: <Widget>[
                                    new Container(
                                      height: 40,
                                      width: _width * (30 / 100),
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.delete, size: 18.0,),
                                              new Text("Delete",
                                                style: TextStyle(
                                                    fontSize: 12.0),)
                                            ],
                                          )),
                                    ),
                                    new Container(
                                      height: 40,
                                      width: _width * (33 / 100),
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.share, size: 18.0,),
                                              new Text("Share via",
                                                  style: TextStyle(
                                                      fontSize: 12.0))
                                            ],
                                          )),
                                    ),
                                    new Container(
                                      height: 40,
                                      width: _width * (37 / 100),
                                      child: FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShowProposals()),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.looks, size: 18.0,),
                                              new Text("Show Proposals",
                                                  style: TextStyle(
                                                      fontSize: 12.0))
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
            new Card(
                margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                elevation: 1.5,
                child: Column(
                  children: <Widget>[
                    new Container(
                        width: _width,
                        child: GestureDetector(
                          onTap: () {},
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
                                                  "images/profilepic.jpg"))),
                                      height: 52,
                                      width: 52,
                                    ),
                                  ),
                                  new Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text("Obada Baqleh",
                                            style: Resource.titTextStyle),
                                        new Text("250 points",
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
                                    createAlertDialog(context);
                                  })
                            ],
                          ),
                        )),
                    new Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new GestureDetector(
                            onTap: () {
                              setState(() {
                                _ispreesed = true;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    "Looking for a roomate",
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
                                        "I'm looking for a female model roomate, must have a double D, nice personality, open minded",
                                        style: Resource.desTextStyle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 5.0, 0.0, 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      new Padding(
                                        padding:
                                        EdgeInsets.only(right: 5.0),
                                        child: Text(
                                          "#roomate",
                                          style: Resource.hashTextStyle,
                                        ),
                                      ),
                                      new Padding(
                                        padding:
                                        EdgeInsets.only(right: 5.0),
                                        child: Text(
                                          "#low_budget",
                                          style: Resource.hashTextStyle,
                                        ),
                                      ),
                                      new Text(
                                        "#empty hashtag",
                                        style: Resource.hashTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Container(
                                width: _width,
                                height: 40,
                                child: Row(
                                  children: <Widget>[
                                    new Container(
                                      height: 40,
                                      width: _width * (30 / 100),
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.delete, size: 18.0,),
                                              new Text("Delete",
                                                style: TextStyle(
                                                    fontSize: 12.0),)
                                            ],
                                          )),
                                    ),
                                    new Container(
                                      height: 40,
                                      width: _width * (33 / 100),
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.share, size: 18.0,),
                                              new Text("Share via",
                                                  style: TextStyle(
                                                      fontSize: 12.0))
                                            ],
                                          )),
                                    ),
                                    new Container(
                                      height: 40,
                                      width: _width * (37 / 100),
                                      child: FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShowProposals()),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.looks, size: 18.0,),
                                              new Text("Show Proposals",
                                                  style: TextStyle(
                                                      fontSize: 12.0))
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
          ],
        ),
      );
  }
}
