import 'package:flutter/material.dart';
import 'package:served/SendProposal.dart';
import 'package:served/ShowProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'Resource.dart';

class mypage extends StatefulWidget {
  @override
  _mypageState createState() => _mypageState();
}

class _mypageState extends State<mypage> {
  String _from = "From";
  String _to = "To";
  String _cost = "Cost";
  bool _ispressed;
  bool _isreport;
  bool _filter;
  int _postNum;
  Widget _list;
  String _title, _description, _postCost, _major;

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
                                  Icons.report,
                                  color: Colors.grey,
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text("Report...",
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
  initState() {
    _isreport = false;
    _filter = false;
    _ispressed = false;
    _list = ListView();
  }

  _createPostsDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < prefs.getInt('postNum'); i++)
      setState(() {
        _title = prefs.getString('postTitle$i');
        _postCost = prefs.getString('postCost$i');
        _major = prefs.getString('postMajor$i');
        _description = prefs.getString('postDescription$i');
      });
  }

  Future<String> _getDetail(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.getString('PostTitle$index');
      prefs.getString('PostCost$index');
      prefs.getString('PostMajor$index');
      prefs.getString('postDescription$index');
    });
  }

  Future<Widget> _createPosts() async {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.width;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('postNum') < 0)
      return _list = ListView(
        children: <Widget>[Text("sex")],
      );
    else
      return _list = ListView.builder(
          itemCount: prefs.getInt('postNum'),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
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
                                        new Text(prefs.getString('postCost$index') ==
                                            null
                                            ? ""
                                            : _getDetail(index),
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color:
                                                Resource.primaryColor))
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
                                _ispressed = false;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    prefs.getString('postTitle$index') ==
                                        null
                                        ? ""
                                        : _getDetail(index),
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
                                        prefs.getString('postDescription$index') ==
                                            null
                                            ? ""
                                            : _getDetail(index),
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
                                          prefs.getString('postMajor$index') ==
                                              null
                                              ? ""
                                              : _getDetail(index),
                                          style: Resource.hashTextStyle,
                                        ),
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
                                      width: _width * (50 / 100),
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.share,
                                                size: 18.0,
                                              ),
                                              new Text("Share via...",
                                                  style: TextStyle(
                                                      fontSize: 12.0))
                                            ],
                                          )),
                                    ),
                                    new Container(
                                      height: 40,
                                      width: _width * (50 / 100),
                                      child: FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SendProposal()),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              new Icon(Icons.work,
                                                  size: 18.0),
                                              new Text("Propose",
                                                  style: TextStyle(
                                                      fontSize: 12))
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
                ));
          });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.width;

    if (_ispressed == false && _filter == false)
      return Container(
        color: Resource.secondColor,
        child: Column(
          children: <Widget>[
            Flexible(
              child: FutureBuilder(
                future: _createPosts(),
                builder: (buildContext, snapshot) {
                  return _list;
                },
              ),
            ),
          ],
        ),
      );
    else if (_ispressed == true && _filter == false)
      return Container(
        color: Resource.secondColor,
        child: Column(
          children: <Widget>[
            new Flexible(
              child: ListView(
                children: <Widget>[
                  new Container(
                    height: _height * (18 / 100),
                    width: _width,
                    color: Resource.secondColor,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _filter = true;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Icon(Icons.filter_vintage,
                                color: Resource.primaryColor),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              "Filter your needs",
                              style: TextStyle(
                                  color: Resource.primaryColor, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Card(
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
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = false;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("100 USD",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = true;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 20.0, 0.0, 0.0),
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
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#taxi",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#low_budget",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#sharing is caring",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#taxi2",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            new Row(
                                              children: <Widget>[
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#hashtag",
                                                    style:
                                                        Resource.hashTextStyle,
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("250 points",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = true;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 20.0, 0.0, 0.0),
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = false;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("100 USD",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = true;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 20.0, 0.0, 0.0),
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
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#taxi",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#low_budget",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#sharing is caring",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#taxi2",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            new Row(
                                              children: <Widget>[
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#hashtag",
                                                    style:
                                                        Resource.hashTextStyle,
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("250 points",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = true;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 20.0, 0.0, 0.0),
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
            )
          ],
        ),
      );
    else if (_ispressed == false && _filter == true)
      return Container(
        color: Resource.secondColor,
        child: Column(
          children: <Widget>[
            new Flexible(
              child: ListView(
                children: <Widget>[
                  new Container(
                    height: _height * (35 / 100),
                    width: _width,
                    color: Resource.secondColor,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _filter = false;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Icon(Icons.filter_vintage,
                                color: Resource.primaryColor),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              "Filter your needs",
                              style: TextStyle(
                                  color: Resource.primaryColor, fontSize: 18),
                            ),
                          ),
                          new Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Container(
                                    height: 35,
                                    width: _width * (25 / 100),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: DropdownButton<String>(
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.black),
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.black,
                                      iconSize: 16.0,
                                      dropdownColor: Colors.white,
                                      underline: Container(
                                        height: 0.0,
                                      ),
                                      value: _cost,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _cost = newValue;
                                        });
                                      },
                                      icon: Icon(Icons.arrow_downward),
                                      items: <String>['Cost', 'Points', 'Money']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  new Container(
                                    height: 35,
                                    width: _width * (25 / 100),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: DropdownButton<String>(
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.black),
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.black,
                                      iconSize: 16.0,
                                      dropdownColor: Colors.white,
                                      underline: Container(
                                        height: 0.0,
                                      ),
                                      value: _from,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _from = newValue;
                                        });
                                      },
                                      icon: Icon(Icons.arrow_downward),
                                      items: <String>['From', 'Syira', 'USA']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  new Container(
                                    height: 35,
                                    width: _width * (25 / 100),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: DropdownButton<String>(
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.black),
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.black,
                                      iconSize: 16.0,
                                      dropdownColor: Colors.white,
                                      underline: Container(
                                        height: 0.0,
                                      ),
                                      value: _to,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _to = newValue;
                                        });
                                      },
                                      icon: Icon(Icons.arrow_downward),
                                      items: <String>['To', 'Syira', 'USA']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  new Container(
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
                                            builder: (context) =>
                                                ShowProfile()),
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
                                                      style: Resource
                                                          .titTextStyle),
                                                  new Text("100 points",
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Resource
                                                              .primaryColor))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        new IconButton(
                                            icon:
                                                Icon(Icons.more_vert, size: 18),
                                            onPressed: () {
                                              createAlertDialog(context);
                                            })
                                      ],
                                    ),
                                  )),
                              new Container(
                                child: Column(
                                  children: <Widget>[
                                    new GestureDetector(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _ispressed = true;
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
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        new Icon(
                                                          Icons.share,
                                                          size: 18.0,
                                                        ),
                                                        new Text("Share via...",
                                                            style: TextStyle(
                                                                fontSize: 12.0))
                                                      ],
                                                    )),
                                              ),
                                              new Container(
                                                height: 40,
                                                width: _width * (50 / 100),
                                                child: FlatButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SendProposal()),
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        new Icon(Icons.work,
                                                            size: 18.0),
                                                        new Text("Propose",
                                                            style: TextStyle(
                                                                fontSize: 12))
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
                          ))),
                  Card(
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
                                              new Text("100 USD",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                        _ispressed = true;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10.0, 20.0, 0.0, 0.0),
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
                                    )),
                                new Padding(
                                    padding: EdgeInsets.only(top: 5.0),
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
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("250 points",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                        _ispressed = true;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10.0, 20.0, 0.0, 0.0),
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
                                    )),
                                new Padding(
                                    padding: EdgeInsets.only(top: 5.0),
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
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                                      color: Resource
                                                          .primaryColor))
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      _ispressed = true;
                                    });
                                  },
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("100 USD",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                        _ispressed = true;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10.0, 20.0, 0.0, 0.0),
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
                                    )),
                                new Padding(
                                    padding: EdgeInsets.only(top: 5.0),
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
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("250 points",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                        _ispressed = true;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10.0, 20.0, 0.0, 0.0),
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
                                    )),
                                new Padding(
                                    padding: EdgeInsets.only(top: 5.0),
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
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
            )
          ],
        ),
      );
    else if (_ispressed == true && _filter == true)
      return Container(
        color: Resource.secondColor,
        child: Column(
          children: <Widget>[
            new Flexible(
              child: ListView(
                children: <Widget>[
                  new Container(
                    height: _height * (35 / 100),
                    width: _width,
                    color: Resource.secondColor,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _filter = false;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Icon(Icons.filter_vintage,
                                color: Resource.primaryColor),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              "Filter your needs",
                              style: TextStyle(
                                  color: Resource.primaryColor, fontSize: 18),
                            ),
                          ),
                          new Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Container(
                                    height: 35,
                                    width: _width * (25 / 100),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: DropdownButton<String>(
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.black),
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.black,
                                      iconSize: 16.0,
                                      dropdownColor: Colors.white,
                                      underline: Container(
                                        height: 0.0,
                                      ),
                                      value: _cost,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _cost = newValue;
                                        });
                                      },
                                      icon: Icon(Icons.arrow_downward),
                                      items: <String>['Cost', 'Points', 'Money']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  new Container(
                                    height: 35,
                                    width: _width * (25 / 100),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: DropdownButton<String>(
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.black),
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.black,
                                      iconSize: 16.0,
                                      dropdownColor: Colors.white,
                                      underline: Container(
                                        height: 0.0,
                                      ),
                                      value: _from,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _from = newValue;
                                        });
                                      },
                                      icon: Icon(Icons.arrow_downward),
                                      items: <String>['From', 'Syira', 'USA']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  new Container(
                                    height: 35,
                                    width: _width * (25 / 100),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: DropdownButton<String>(
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.black),
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.black,
                                      iconSize: 16.0,
                                      dropdownColor: Colors.white,
                                      underline: Container(
                                        height: 0.0,
                                      ),
                                      value: _to,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _to = newValue;
                                        });
                                      },
                                      icon: Icon(Icons.arrow_downward),
                                      items: <String>['To', 'Syira', 'USA']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  new Card(
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
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = false;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("100 USD",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = true;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 20.0, 0.0, 0.0),
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
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#taxi",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#low_budget",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#sharing is caring",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#taxi2",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            new Row(
                                              children: <Widget>[
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#hashtag",
                                                    style:
                                                        Resource.hashTextStyle,
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("250 points",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = true;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 20.0, 0.0, 0.0),
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = false;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("100 USD",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = true;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 20.0, 0.0, 0.0),
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
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#taxi",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#low_budget",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#sharing is caring",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#taxi2",
                                                    style:
                                                        Resource.hashTextStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            new Row(
                                              children: <Widget>[
                                                new Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.0),
                                                  child: Text(
                                                    "#hashtag",
                                                    style:
                                                        Resource.hashTextStyle,
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                              new Text("250 points",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Resource
                                                          .primaryColor))
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
                                      _ispressed = true;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 20.0, 0.0, 0.0),
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
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.share,
                                                      size: 18.0,
                                                    ),
                                                    new Text("Share via...",
                                                        style: TextStyle(
                                                            fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width * (50 / 100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SendProposal()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.work,
                                                        size: 18.0),
                                                    new Text("Propose",
                                                        style: TextStyle(
                                                            fontSize: 12))
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
            )
          ],
        ),
      );
  }
}
