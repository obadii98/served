import 'package:flutter/material.dart';
import 'package:served/ShowProfile.dart';
import 'package:served/signin.dart';
import 'GuestBoard.dart';
import 'Resource.dart';

class mypage extends StatefulWidget {
  @override
  _mypageState createState() => _mypageState();
}

class _mypageState extends State<mypage> {
  Widget _card;
  Widget _newCard;
  bool _isCard;
  bool _isreport;
  bool _ispressed;

  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset("images/logo.png",
                    width: 52, height: 52),
                new Text("Served",
                    style: TextStyle(
                        fontSize: 32.0,
                        letterSpacing: 3.5,
                        fontFamily: 'Caveat',
                        color: Colors.white))
              ],
            ),
              backgroundColor: Resource.primaryColor,
              content: Container(
                height: 60,
                child: Row(
                  children: <Widget>[
                    new Text("Please ",
                        style:
                        TextStyle(color: Colors.white, fontSize: 18)),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      child: Text("sign up ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline)),
                    ),
                    new Text("to make a proposal.",
                        style:
                        TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
              ));
        });
  }

  @override
  initState() {
    _ispressed = false;
    _isreport = false;
    _newCard = Card(
        margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
        elevation: 2.5,
        child: Row(
          children: <Widget>[
            new Container(
                height: 212,
                width: 70,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShowProfile()),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage("images/ali.jpg"))),
                        height: 52,
                        width: 52,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Ali Issa",
                            style: TextStyle(
                              fontSize: 18.0,
                            )),
                      ),
                    ],
                  ),
                )),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 4.0, color: Resource.primaryColor),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 330,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(
                                "Title",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          "Type",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                        child: Text(
                          "Majors: #major1, #major2",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      new Row(
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                            child: Text("From: Syria",
                                style: TextStyle(fontSize: 16.0)),
                          ),
                          new Padding(
                            padding: EdgeInsets.fromLTRB(100.0, 5.0, 0.0, 5.0),
                            child: Text("To: Jordan",
                                style: TextStyle(fontSize: 16.0)),
                          )
                        ],
                      ),
                      new Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          "COST",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Container(
                        width: 300,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                          child: Text(
                            "This is the description its very long it have 4 lines max, and it can be null, depends on the user",
                            style: TextStyle(fontSize: 16.0),
                            maxLines: 5,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                    ],
                  ),
                  new GestureDetector(
                    onTap: () {
                      setState(() {
                        _ispressed = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Icon(
                          Icons.arrow_back,
                          size: 14.0,
                          color: Resource.primaryColor,
                        ),
                        new Text(
                          "see less",
                          style: TextStyle(
                              fontSize: 14.0, color: Resource.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Container(
                        width: 337,
                        height: 30,
                        child: Row(
                          children: <Widget>[
                            new Container(
                              width: 168.5,
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Icon(Icons.share),
                                      new Text("Share")
                                    ],
                                  )),
                            ),
                            new Container(
                              width: 168.5,
                              child: FlatButton(
                                  onPressed: () {
                                    createAlertDialog(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Icon(Icons.work),
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
        ));
    _isCard = true;
  }

  @override
  Widget build(BuildContext context) {

    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    if (_ispressed == false) {
      return Column(
        children: <Widget>[
          Card(
              margin: EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
              elevation: 2.5,
              child: Column(
                children: <Widget>[
                  new Container(
                      height: _height * (15 / 100),
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
                                      5.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("Ali Issa",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight:
                                              FontWeight.bold)),
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
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Sending document from syria",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Text("From: Syria",
                                      style: TextStyle(fontSize: 16.0)),
                                  new Text("To: Jordan",
                                      style: TextStyle(fontSize: 16.0)),
                                ],
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
                                    style: TextStyle(fontSize: 16.0),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              _ispressed = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Text(
                                "see more",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Resource.primaryColor),
                              ),
                              new Icon(
                                Icons.arrow_forward,
                                size: 14.0,
                                color: Resource.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: _width,
                              height: 30,
                              child: Row(
                                children: <Widget>[
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.share),
                                            new Text("Share")
                                          ],
                                        )),
                                  ),
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {
                                          createAlertDialog(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.work),
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
          Card(
              margin: EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
              elevation: 2.5,
              child: Column(
                children: <Widget>[
                  new Container(
                      height: _height * (15 / 100),
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
                                      5.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("Ali Issa",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight:
                                              FontWeight.bold)),
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
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Sending document from syria",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Text("From: Syria",
                                      style: TextStyle(fontSize: 16.0)),
                                  new Text("To: Jordan",
                                      style: TextStyle(fontSize: 16.0)),
                                ],
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
                                    style: TextStyle(fontSize: 16.0),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              _ispressed = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Text(
                                "see more",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Resource.primaryColor),
                              ),
                              new Icon(
                                Icons.arrow_forward,
                                size: 14.0,
                                color: Resource.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: _width,
                              height: 30,
                              child: Row(
                                children: <Widget>[
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.share),
                                            new Text("Share")
                                          ],
                                        )),
                                  ),
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {
                                          createAlertDialog(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.work),
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
          Card(
              margin: EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
              elevation: 2.5,
              child: Column(
                children: <Widget>[
                  new Container(
                      height: _height * (15 / 100),
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
                                      5.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("Ali Issa",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight:
                                              FontWeight.bold)),
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
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Sending document from syria",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Text("From: Syria",
                                      style: TextStyle(fontSize: 16.0)),
                                  new Text("To: Jordan",
                                      style: TextStyle(fontSize: 16.0)),
                                ],
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
                                    style: TextStyle(fontSize: 16.0),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              _ispressed = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Text(
                                "see more",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Resource.primaryColor),
                              ),
                              new Icon(
                                Icons.arrow_forward,
                                size: 14.0,
                                color: Resource.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: _width,
                              height: 30,
                              child: Row(
                                children: <Widget>[
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.share),
                                            new Text("Share")
                                          ],
                                        )),
                                  ),
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {
                                          createAlertDialog(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.work),
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
          Card(
              margin: EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
              elevation: 2.5,
              child: Column(
                children: <Widget>[
                  new Container(
                      height: _height * (15 / 100),
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
                                      5.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("Ali Issa",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight:
                                              FontWeight.bold)),
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
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Sending document from syria",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Text("From: Syria",
                                      style: TextStyle(fontSize: 16.0)),
                                  new Text("To: Jordan",
                                      style: TextStyle(fontSize: 16.0)),
                                ],
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
                                    style: TextStyle(fontSize: 16.0),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              _ispressed = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Text(
                                "see more",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Resource.primaryColor),
                              ),
                              new Icon(
                                Icons.arrow_forward,
                                size: 14.0,
                                color: Resource.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: _width,
                              height: 30,
                              child: Row(
                                children: <Widget>[
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.share),
                                            new Text("Share")
                                          ],
                                        )),
                                  ),
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {
                                          createAlertDialog(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.work),
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
        ],
      );
    } else
      return Column(
        children: <Widget>[
          new Card(
              margin: EdgeInsets.fromLTRB(0, 10.0, 0, 15.0),
              elevation: 2.5,
              child: Column(
                children: <Widget>[
                  new Container(
                      height: _height * (15 / 100),
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
                                      5.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("Ali Issa",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight:
                                              FontWeight.bold)),
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
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Sending document from syria",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Text("From: Syria",
                                      style: TextStyle(fontSize: 16.0)),
                                  new Text("To: Jordan",
                                      style: TextStyle(fontSize: 16.0)),
                                ],
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
                                    style: TextStyle(fontSize: 16.0),
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
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Resource.primaryColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                    EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      "#syria",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Resource.primaryColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                    EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      "#jordan",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Resource.primaryColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  new Text(
                                    "#points_service",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Resource.primaryColor,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              _ispressed = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Icon(
                                Icons.arrow_back,
                                size: 14.0,
                                color: Resource.primaryColor,
                              ),
                              new Text(
                                "see less",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Resource.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: _width,
                              height: 30,
                              child: Row(
                                children: <Widget>[
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.share),
                                            new Text("Share")
                                          ],
                                        )),
                                  ),
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {
                                          createAlertDialog(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.work),
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
          new Card(
              margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
              elevation: 2.5,
              child: Column(
                children: <Widget>[
                  new Container(
                      height: _height * (15 / 100),
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
                                      5.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("Ali Issa",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight:
                                              FontWeight.bold)),
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
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Sending document from syria",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Text("From: Syria",
                                      style: TextStyle(fontSize: 16.0)),
                                  new Text("To: Jordan",
                                      style: TextStyle(fontSize: 16.0)),
                                ],
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
                                    style: TextStyle(fontSize: 16.0),
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
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Resource.primaryColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                    EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      "#syria",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Resource.primaryColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                    EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      "#jordan",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Resource.primaryColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  new Text(
                                    "#points_service",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Resource.primaryColor,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              _ispressed = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Icon(
                                Icons.arrow_back,
                                size: 14.0,
                                color: Resource.primaryColor,
                              ),
                              new Text(
                                "see less",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Resource.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: _width,
                              height: 30,
                              child: Row(
                                children: <Widget>[
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.share),
                                            new Text("Share")
                                          ],
                                        )),
                                  ),
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {
                                          createAlertDialog(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.work),
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
          new Card(
              margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
              elevation: 2.5,
              child: Column(
                children: <Widget>[
                  new Container(
                      height: _height * (15 / 100),
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
                                      5.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("Ali Issa",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight:
                                              FontWeight.bold)),
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
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Sending document from syria",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Text("From: Syria",
                                      style: TextStyle(fontSize: 16.0)),
                                  new Text("To: Jordan",
                                      style: TextStyle(fontSize: 16.0)),
                                ],
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
                                    style: TextStyle(fontSize: 16.0),
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
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Resource.primaryColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                    EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      "#syria",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Resource.primaryColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                    EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      "#jordan",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Resource.primaryColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  new Text(
                                    "#points_service",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Resource.primaryColor,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        new GestureDetector(
                          onTap: () {
                            setState(() {
                              _ispressed = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Icon(
                                Icons.arrow_back,
                                size: 14.0,
                                color: Resource.primaryColor,
                              ),
                              new Text(
                                "see less",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Resource.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: _width,
                              height: 30,
                              child: Row(
                                children: <Widget>[
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.share),
                                            new Text("Share")
                                          ],
                                        )),
                                  ),
                                  new Container(
                                    width: _width * (50 / 100),
                                    child: FlatButton(
                                        onPressed: () {
                                          createAlertDialog(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Icon(Icons.work),
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
        ],
      );
  }
}
