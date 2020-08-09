import 'package:flutter/material.dart';

import 'MyDetails.dart';
import 'MyPosts.dart';
import 'MyProposals.dart';
import 'Resource.dart';

class ScrolledProfile extends StatefulWidget {
  @override
  _ScrolledProfileState createState() => _ScrolledProfileState();
}

class _ScrolledProfileState extends State<ScrolledProfile> {
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
    return Container(
      child: Column(
        children: <Widget>[
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
                            color: Colors.black, fontSize: 18.0),
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
                            color: Colors.black, fontSize: 18.0),
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
                            color: Colors.black, fontSize: 18.0),
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
