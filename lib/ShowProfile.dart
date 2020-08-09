import 'package:flutter/material.dart';
import 'UserPosts.dart';
import 'MyDetails.dart';
import 'package:served/Resource.dart';

class ShowProfile extends StatefulWidget {
  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  Widget _appbar;
  bool _isreport = false;

  @override
  void initState() {
    _appbar = Text("Served",
        style: new TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            letterSpacing: 3.5,
            fontFamily: 'Caveat'));
    _isreport = false;
  }

  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    if (_isreport == false)
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: Container(
                    height: 150,
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
                            child: Text("Report...",
                                style: TextStyle(color: Colors.black))),
                        new FlatButton(
                            onPressed: () {},
                            child: Text("Copy Profile URL",
                                style: TextStyle(color: Colors.black))),
                        new FlatButton(
                            onPressed: () {},
                            child: Text("Share this Profile",
                                style: TextStyle(color: Colors.black))),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Resource.primaryColor,
        title: _appbar,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                createAlertDialog(context);
              }),
        ],
      ),
      body: showProfile(),
    );
  }
}

class showProfile extends StatefulWidget {
  @override
  _showProfileState createState() => _showProfileState();
}

class _showProfileState extends State<showProfile> {
  BoxDecoration _active;
  BoxDecoration _unactive;
  bool _ispost;
  bool _isdetail;

  @override
  void initState() {
    _active = BoxDecoration(
      color: Colors.grey[100],
    );
    _unactive = BoxDecoration(
      color: Colors.grey[200],
      boxShadow: [
        BoxShadow(
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.5,
        ),
      ],
    );
    _ispost = true;
    _isdetail = false;
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    if (_ispost == true) {
      return Container(
          child: ListView(
        children: <Widget>[
          new Container(
            height: _height * (50 / 100),
            color: Resource.primaryColor,
            child: Column(
              children: <Widget>[
                new Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Center(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage("images/ali.jpg"))),
                      height: 72,
                      width: 72,
                    ))),
                new Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Text(
                      "Ali Issa",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Text(
                      "Helping people is my passion, but ali is gay, tellawy beaklo, and malek is bot",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(
                      child: Container(
                    height: 25,
                    width: 50,
                    child: Image.asset("images/syria.png"),
                  )),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Card(
                    elevation: 5.0,
                    child: Container(
                      width: _width * (75 / 100),
                      height: 55,
                      child: Row(
                        children: <Widget>[
                          new Container(
                            width: _width * (25 / 100),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: Colors.black))),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.security,
                                  size: 30,
                                  color: Resource.primaryColor,
                                ),
                                new Text(
                                  "2.5",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                          ),
                          new Container(
                            width: _width * (25 / 100),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: Colors.black))),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Icon(
                                    Icons.feedback,
                                    size: 30,
                                    color: Resource.primaryColor,
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Icon(
                                        Icons.star,
                                        size: 17,
                                      ),
                                      new Icon(
                                        Icons.star,
                                        size: 17,
                                      ),
                                      new Icon(
                                        Icons.star,
                                        size: 17,
                                      ),
                                      new Icon(
                                        Icons.star_half,
                                        size: 17,
                                      ),
                                      new Icon(
                                        Icons.star_border,
                                        size: 17,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          new Container(
                            width: _width * (25 / 100),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Icon(
                                    Icons.assignment_turned_in,
                                    size: 30,
                                    color: Resource.primaryColor,
                                  ),
                                  new Text(
                                    "25",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 23.8),
                  child: Container(
                    width: _width,
                    height: _height * (7 / 100),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      children: <Widget>[
                        new Container(
                          width: _width * (50 / 100),
                          decoration: _active,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                _ispost = true;
                                _isdetail = false;
                              });
                            },
                            child: Text(
                              "Posts",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          ),
                        ),
                        new Container(
                          width: _width * (50 / 100),
                          decoration: _unactive,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                _ispost = false;
                                _isdetail = true;
                              });
                            },
                            child: Text(
                              "Details",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          new UserPosts(),
        ],
      ));
    } else {
      return Container(
        child: ListView(
          children: <Widget>[
            new Container(
              height: _height * (50 / 100),
              color: Resource.primaryColor,
              child: Column(
                children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Center(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage("images/ali.jpg"))),
                        height: 72,
                        width: 72,
                      ))),
                  new Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text(
                        "Ali Issa",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Center(
                      child: Text(
                        "Helping people is my passion, but ali is gay, tellawy beaklo, and malek is bot",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Center(
                        child: Container(
                      height: 25,
                      width: 50,
                      child: Image.asset("images/syria.png"),
                    )),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Center(
                        child: Card(
                      elevation: 5.0,
                      child: Container(
                        width: _width * (75 / 100),
                        height: 55,
                        child: Row(
                          children: <Widget>[
                            new Container(
                              width: _width * (25 / 100),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(color: Colors.black))),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.security,
                                    size: 30,
                                    color: Resource.primaryColor,
                                  ),
                                  new Text(
                                    "2.5",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                            ),
                            new Container(
                              width: _width * (25 / 100),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(color: Colors.black))),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.feedback,
                                      size: 30,
                                      color: Resource.primaryColor,
                                    ),
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Icon(
                                          Icons.star,
                                          size: 17,
                                        ),
                                        new Icon(
                                          Icons.star,
                                          size: 17,
                                        ),
                                        new Icon(
                                          Icons.star,
                                          size: 17,
                                        ),
                                        new Icon(
                                          Icons.star_half,
                                          size: 17,
                                        ),
                                        new Icon(
                                          Icons.star_border,
                                          size: 17,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            new Container(
                              width: _width * (25 / 100),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.assignment_turned_in,
                                      size: 30,
                                      color: Resource.primaryColor,
                                    ),
                                    new Text(
                                      "25",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 23.8),
                    child: Container(
                      width: _width,
                      height: _height * (7 / 100),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        children: <Widget>[
                          new Container(
                            width: _width * (50 / 100),
                            decoration: _unactive,
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  _ispost = true;
                                  _isdetail = false;
                                });
                              },
                              child: Text(
                                "Posts",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                            ),
                          ),
                          new Container(
                            width: _width * (50 / 100),
                            decoration: _active,
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  _ispost = false;
                                  _isdetail = true;
                                });
                              },
                              child: Text(
                                "Details",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            new UserDetails(),
          ],
        ),
      );
    }
  }
}
