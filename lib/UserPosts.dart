import 'package:flutter/material.dart';
import 'package:served/SendProposal.dart';
import 'ShowProfile.dart';
import 'package:served/Resource.dart';

class UserPosts extends StatefulWidget {
  @override
  _UserPostsState createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {

  bool _ispreesed;
  bool _isreport;

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
  void initState() {
    _isreport = false;
    _ispreesed = false;
  }

  @override
  Widget build(BuildContext context) {
    if(_ispreesed == false)
      return Container(
        color: Resource.secondColor,
        child: Column(
          children: <Widget>[
            new Card(
                margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                elevation: 2.5,
                child: Row(
                  children: <Widget>[
                    new Container(
                        height: 150,
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
                                      new IconButton(
                                          icon: Icon(Icons.more_vert, size: 18),
                                          onPressed: () {
                                            createAlertDialog(context);
                                          })
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
                            ],
                          ),
                          new GestureDetector(
                            onTap: () {
                              setState(() {
                                _ispreesed = true;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Text(
                                  "see more",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Resource.primaryColor),
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SendProposal()),
                                            );
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
                )),
            new Card(
                margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                elevation: 2.5,
                child: Row(
                  children: <Widget>[
                    new Container(
                        height: 150,
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
                                      new IconButton(
                                          icon: Icon(Icons.more_vert, size: 18),
                                          onPressed: () {
                                            createAlertDialog(context);
                                          })
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
                            ],
                          ),
                          new GestureDetector(
                            onTap: () {
                              setState(() {
                                _ispreesed = true;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Text(
                                  "see more",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Resource.primaryColor),
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SendProposal()),
                                            );
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
                )),
            new Card(
                margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                elevation: 2.5,
                child: Row(
                  children: <Widget>[
                    new Container(
                        height: 150,
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
                                      new IconButton(
                                          icon: Icon(Icons.more_vert, size: 18),
                                          onPressed: () {
                                            createAlertDialog(context);
                                          })
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
                            ],
                          ),
                          new GestureDetector(
                            onTap: () {
                              setState(() {
                                _ispreesed = true;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Text(
                                  "see more",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Resource.primaryColor),
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SendProposal()),
                                            );
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
                )),
            new Card(
                margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                elevation: 2.5,
                child: Row(
                  children: <Widget>[
                    new Container(
                        height: 150,
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
                                      new IconButton(
                                          icon: Icon(Icons.more_vert, size: 18),
                                          onPressed: () {
                                            createAlertDialog(context);
                                          })
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
                            ],
                          ),
                          new GestureDetector(
                            onTap: () {
                              setState(() {
                                _ispreesed = true;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Text(
                                  "see more",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Resource.primaryColor),
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SendProposal()),
                                            );
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
                )),
          ],
        ),
      );
    else
      return Container(
        color: Resource.secondColor,
        child: Column(
          children: <Widget>[
            new Card(
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
                                      new IconButton(
                                          icon: Icon(Icons.more_vert, size: 18),
                                          onPressed: () {
                                            createAlertDialog(context);
                                          })
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
                                _ispreesed = false;
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SendProposal()),
                                            );},
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
                )),
            new Card(
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
                                      new IconButton(
                                          icon: Icon(Icons.more_vert, size: 18),
                                          onPressed: () {
                                            createAlertDialog(context);
                                          })
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
                                _ispreesed = false;
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SendProposal()),
                                            );},
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
                )),
            new Card(
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
                                      new IconButton(
                                          icon: Icon(Icons.more_vert, size: 18),
                                          onPressed: () {
                                            createAlertDialog(context);
                                          })
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
                                _ispreesed = false;
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SendProposal()),
                                            );},
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
                )),
            new Card(
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
                                      new IconButton(
                                          icon: Icon(Icons.more_vert, size: 18),
                                          onPressed: () {
                                            createAlertDialog(context);
                                          })
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
                                _ispreesed = false;
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SendProposal()),
                                            );},
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
                )),
          ],
        ),
      );
  }
}

