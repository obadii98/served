import 'package:flutter/material.dart';
import 'package:served/PostPage.dart';
import 'package:served/Resource.dart';

class UserProposals extends StatefulWidget {
  @override
  _UserProposalsState createState() => _UserProposalsState();
}

class _UserProposalsState extends State<UserProposals> {
  @override
  Widget build(BuildContext context) {

    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Container(
      color: Resource.secondColor,
      child: ListView(
        children: <Widget>[
          new Card(margin: EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
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
                          onTap: (){},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Container(
                                  width: _width,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        5.0, 5.0, 0.0, 0.0),
                                    child: GestureDetector(
                                      child: Text(
                                        "Sending document from syria",
                                        style: Resource.urlTextStyle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
                                      },
                                    ),
                                  ),
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
                                      "+963 951 490 964",
                                      style: Resource.desTextStyle,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
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
                                      "24 Hour",
                                      style: Resource.desTextStyle,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
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
                                    width: _width,
                                    height: 40,
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
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              )
          ),
          new Card(margin: EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
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
                          onTap: (){},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Container(
                                  width: _width,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        5.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      "+963 951 490 964",
                                      style: Resource.desTextStyle,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
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
                                      "24 Hour",
                                      style: Resource.desTextStyle,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
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
                                    child: GestureDetector(
                                      child: Text(
                                        "Sending document from syria",
                                        style: Resource.urlTextStyle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      onTap: (){},
                                    ),
                                  ),
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
                                    width: _width,
                                    height: 40,
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
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              )
          ),
          new Card(margin: EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
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
                          onTap: (){},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Padding(
                                padding: EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Container(
                                  width: _width,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        5.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      "+963 951 490 964",
                                      style: Resource.desTextStyle,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
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
                                      "24 Hour",
                                      style: Resource.desTextStyle,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
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
                                    child: GestureDetector(
                                      child: Text(
                                        "Sending document from syria",
                                        style: Resource.urlTextStyle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      onTap: (){},
                                    ),
                                  ),
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
                                    width: _width,
                                    height: 40,
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
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
