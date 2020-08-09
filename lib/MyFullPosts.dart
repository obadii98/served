import 'package:flutter/material.dart';
import 'Resource.dart';
import 'ShowProposals.dart';
import 'UserBoard.dart';

class MyFullPosts extends StatefulWidget {
  @override
  _MyFullPostsState createState() => _MyFullPostsState();
}

class _MyFullPostsState extends State<MyFullPosts> {

  bool _ispreesed;
  ScrollController _scrollCont;

  @override
  void initState() {
    _ispreesed = false;
    _scrollCont = ScrollController();
    _scrollCont.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_scrollCont.offset <= _scrollCont.position.minScrollExtent &&
        !_scrollCont.position.outOfRange) {
      setState(() {
        print("reach the top");
        Resource.isDraged = false;
        Navigator.of(context).pop();
      });
    }
    else if (_scrollCont.offset >= _scrollCont.position.maxScrollExtent &&
        !_scrollCont.position.outOfRange) {
      setState(() {
        print("reach the bottom");
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    if(_ispreesed == false)
      return Container(
        height: _height,
        width: _width,
        color: Resource.secondColor,
        child: Column(
          children: <Widget>[
            new Container(
              color: Resource.primaryColor,
              margin: EdgeInsets.only(top: 23.0),
              width: _width,
              height: _height * (12/100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.only(top: 0.0),
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
                    padding: EdgeInsets.only(top: 0.0),
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
            ),
            new Expanded(
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
                                                    padding: EdgeInsets.only(left: 5.0),
                                                    child: Text("20/10/2020",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Resource.primaryColor)),
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
                                  onTap: (){
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
                                            width: _width*(30/100),
                                            height: 40,
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            width: _width*(33/100),
                                            height: 40,
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            width: _width*(37/100),
                                            height: 40,
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                                    padding: EdgeInsets.only(left: 5.0),
                                                    child: Text("20/10/2020",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Resource.primaryColor)),
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                                    padding: EdgeInsets.only(left: 5.0),
                                                    child: Text("20/10/2020",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Resource.primaryColor)),
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0),)
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                                    padding: EdgeInsets.only(left: 5.0),
                                                    child: Text("20/10/2020",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Resource.primaryColor)),
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
                                  onTap: (){
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
                                            width: _width*(30/100),
                                            height: 40,
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            width: _width*(33/100),
                                            height: 40,
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            width: _width*(37/100),
                                            height: 40,
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                                    padding: EdgeInsets.only(left: 5.0),
                                                    child: Text("20/10/2020",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Resource.primaryColor)),
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                                    padding: EdgeInsets.only(left: 5.0),
                                                    child: Text("20/10/2020",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Resource.primaryColor)),
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0),)
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
        )
      );
    else
      return Container(
        color: Resource.secondColor,
        child: Column(
          children: <Widget>[
            new Container(
              color: Resource.primaryColor,
              margin: EdgeInsets.only(top: 23.0),
              width: _width,
              height: _height * (12/100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.only(top: 0.0),
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
                    padding: EdgeInsets.only(top: 0.0),
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
            ),
            new Expanded(
              child: ListView(
                controller: _scrollCont,
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
                                        })
                                  ],
                                ),
                              )),
                          new Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                new GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _ispreesed=false;
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0),)
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0),)
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0),)
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                        })
                                  ],
                                ),
                              )),
                          new Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                new GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _ispreesed=false;
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0),)
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0),)
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
                                            width: _width*(30/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.delete,size: 18.0,),
                                                    new Text("Delete",style: TextStyle(fontSize: 12.0),)
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(33/100),
                                            child: FlatButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.share,size: 18.0,),
                                                    new Text("Share via",style: TextStyle(fontSize: 12.0))
                                                  ],
                                                )),
                                          ),
                                          new Container(
                                            height: 40,
                                            width: _width*(37/100),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ShowProposals()),
                                                  );},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(Icons.looks,size: 18.0,),
                                                    new Text("Show Proposals",style: TextStyle(fontSize: 12.0))
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
