import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:served/MyPosts.dart';
import 'package:served/MyDetails.dart';
import 'package:served/MyProposals.dart';
import 'package:served/Resource.dart';
import 'UserPosts.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  BoxDecoration _pbox, _probox, _dbox, _unactive, _active;
  PageController _control;
  PageView _pageView;
  int _initpge;
  int bottomSelectedIndex;

  @override
  void initState() {
    _unactive = BoxDecoration(
      color: Resource.secondColor,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.5,
        ),
      ],
    );
    _active = BoxDecoration(
      color: Colors.grey[100],
      border: Border(
          bottom: BorderSide(
              color: Resource.primaryColor,
              width: 3.0
          )
      ),
    );
    _probox = _unactive;
    _dbox = _unactive;
    _pbox = _active;
    _initpge = 0;
    _control = PageController(
      initialPage: _initpge,
    );
    _pageView = PageView(
      controller: _control,
      onPageChanged: (int page) {
        setState(() {
          if (page == 0) {
            _probox = _unactive;
            _dbox = _unactive;
            _pbox = _active;
          }
          else if (page == 1) {
            _probox = _active;
            _dbox = _unactive;
            _pbox = _unactive;
          }
          else {
            _probox = _unactive;
            _dbox = _active;
            _pbox = _unactive;
          }
        });
      },
      children: <Widget>[
        new MyPosts(),
        new UserProposals(),
        new UserDetails()
      ],
    );
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
    return  Container(
        child: Column(
          children: <Widget>[
            new Container(
              height: _height * (33 / 100),
              width: _width,
              decoration: BoxDecoration(
                  color: Resource.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(100, 80),
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        image:
                                        new AssetImage (
                                            "images/profilepic.jpg"))),
                                height: 72,
                                width: 72,
                              ))),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Center(
                            child: Card(
                              color: Resource.secondColor,
                              elevation: 5.0,
                              child: Container(
                                width: _width * (65 / 100),
                                height: 55,
                                child: Row(
                                  children: <Widget>[
                                    new Container(
                                      width: _width * (19 / 100),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: Colors.black))),
                                      child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.security,
                                                size: 28,
                                                color: Resource
                                                    .activePrimColor,
                                              ),
                                              new Text(
                                                "2.5",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              )
                                            ],
                                          )),
                                    ),
                                    new Container(
                                      width: _width * (27 / 100),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: Colors.black))),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            new Icon(
                                              Icons.feedback,
                                              size: 28,
                                              color: Resource.activePrimColor,
                                            ),
                                            new Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.star,
                                                  size: 15,
                                                ),
                                                new Icon(
                                                  Icons.star,
                                                  size: 15,
                                                ),
                                                new Icon(
                                                  Icons.star,
                                                  size: 15,
                                                ),
                                                new Icon(
                                                  Icons.star_half,
                                                  size: 15,
                                                ),
                                                new Icon(
                                                  Icons.star_border,
                                                  size: 15,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    new Container(
                                      width: _width * (19 / 100),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            new Icon(
                                              Icons.assignment_turned_in,
                                              size: 28,
                                              color: Resource.activePrimColor,
                                            ),
                                            new Text(
                                              "25",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight
                                                      .bold),
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
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 0.0),
                    child: Text(
                      "Obada Baqleh",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
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
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
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
                ],
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(top: 0),
              child: Container(
                width: _width,
                height: _height * (7 / 100),
                decoration: BoxDecoration(
                  color: Resource.secondColor,
                ),
                child: Row(
                  children: <Widget>[
                    new Container(
                      height: _height * (7 / 100),
                      width: _width * (32 / 100),
                      decoration: _pbox,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _pbox = _active;
                            _probox = _unactive;
                            _dbox = _unactive;
                            _control.animateToPage(
                                0, duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          });
                        },
                        child: Text(
                          "Posts",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ),
                    new Container(
                      height: _height * (7 / 100),
                      width: _width * (36 / 100),
                      decoration: _probox,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _pbox = _unactive;
                            _probox = _active;
                            _dbox = _unactive;
                            _control.animateToPage(
                                1, duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          });
                        },
                        child: Text(
                          "Proposals",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ),
                    new Container(
                      height: _height * (7 / 100),
                      width: _width * (32 / 100),
                      decoration: _dbox,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _pbox = _unactive;
                            _probox = _unactive;
                            _dbox = _active;
                            _control.animateToPage(
                                2, duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          });
                        },
                        child: Text(
                          "Details",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Expanded(
              child: _pageView,
            )
          ],
        ),
      );
  }
}
