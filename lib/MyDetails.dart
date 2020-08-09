import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:served/Resource.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Container(
      color: Resource.secondColor,
      child: ListView(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
            child: Text("Badges:",
                style: Resource.titTextStyle, textAlign: TextAlign.left),
          ),
          new Container(
            height: _height * (22 / 100),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Card(
                  elevation: 5,
                  child: Container(
                    width: _width * (33 / 100),
                    child: Column(
                      children: <Widget>[
                        new Icon(
                          Icons.security,
                          size: 52.0,
                          color: Resource.primaryColor,
                        ),
                        new Column(
                          children: <Widget>[
                            Text("The Honorable", style: Resource.titTextStyle),
                            new Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text(
                                  "He who got the 5 marks on security",
                                  style: Resource.badgeDesTextStyle,textAlign: TextAlign.center),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                new Card(
                  elevation: 5,
                  child: Container(
                    width: _width * (33 / 100),
                    child: Column(
                      children: <Widget>[
                        new Image.asset("images/TheHero.png",width: 52,height: 52,color: Resource.activePrimColor,),
                        new Column(
                          children: <Widget>[
                            Text("The Hero", style: Resource.titTextStyle),
                            new Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text(
                                  "He who served more than 50 people",
                                  style: Resource.badgeDesTextStyle,textAlign: TextAlign.center),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                new Card(
                  elevation: 5,
                  child: Container(
                    width: _width * (33 / 100),
                    child: Column(
                      children: <Widget>[
                        new Image.asset("images/TheStar.png",width: 52,height: 52,color: Resource.activePrimColor,),
                        new Column(
                          children: <Widget>[
                            Text("The Star", style: Resource.titTextStyle),
                            new Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text(
                                  "He who have more than 10 five stars' feedback",
                                  style: Resource.badgeDesTextStyle,textAlign: TextAlign.center),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                new Card(
                  elevation:  5,
                  child: Container(
                    width: _width * (33 / 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Image.asset("images/worm.png",width: 52,height: 52,color: Resource.primaryColor,),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text("The Leech", style: Resource.titTextStyle),
                            new Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text(
                                  "He who have been served more than 50 time",
                                  style: Resource.badgeDesTextStyle,textAlign: TextAlign.center),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                new Card(
                  elevation: 5,
                  child: Container(
                    width: _width * (33 / 100),
                    child: Column(
                      children: <Widget>[
                        new Image.asset("images/TheHelper.png",width: 52,height: 52,color: Resource.activePrimColor,),
                        new Column(
                          children: <Widget>[
                            Text("The Volunteer", style: Resource.titTextStyle),
                            new Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text(
                                  "He who proposed for more than 50 times",
                                  style: Resource.badgeDesTextStyle,textAlign: TextAlign.center),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
            child: Text("Feedbacks:",
                style: Resource.titTextStyle, textAlign: TextAlign.left),
          ),
          new Card(
            elevation: 1.5,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Container(
              height: _height * (22 / 100),
              width: _width * (80 / 100),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(width: 4.0, color: Resource.primaryColor),
                ),
              ),
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage(
                                          "images/ahmad.jpg"))),
                              height: 52,
                              width: 52,
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text("Ahmad Jamal",
                                style: Resource.titTextStyle),
                          )
                        ],
                      ),
                      new Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Row(
                            children: <Widget>[
                              new Icon(Icons.star, size: 18.0),
                              new Icon(Icons.star, size: 18.0),
                              new Icon(Icons.star_half, size: 18.0),
                              new Icon(Icons.star_border, size: 18.0),
                              new Icon(Icons.star_border, size: 18.0),
                            ],
                          ))
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                    child: Text(
                      "Obada is the best but I gave him only 2 and a half stars cause he is AWESOME",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: Resource.desTextStyle),
                  )
                ],
              ),
            ),
          ),
          new Card(
            elevation: 1.5,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Container(
              height: _height * (22 / 100),
              width: _width * (80 / 100),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(width: 4.0, color: Resource.primaryColor),
                ),
              ),
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage(
                                          "images/ahmad.jpg"))),
                              height: 52,
                              width: 52,
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text("Ahmad Jamal",
                                style: Resource.titTextStyle),
                          )
                        ],
                      ),
                      new Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Row(
                            children: <Widget>[
                              new Icon(Icons.star, size: 18.0),
                              new Icon(Icons.star, size: 18.0),
                              new Icon(Icons.star_half, size: 18.0),
                              new Icon(Icons.star_border, size: 18.0),
                              new Icon(Icons.star_border, size: 18.0),
                            ],
                          ))
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                    child: Text(
                        "Obada is the best but I gave him only 2 and a half stars cause he is AWESOME",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: Resource.desTextStyle),
                  )
                ],
              ),
            ),
          ),
          new Card(
            elevation: 1.5,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Container(
              height: _height * (22 / 100),
              width: _width * (80 / 100),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(width: 4.0, color: Resource.primaryColor),
                ),
              ),
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage(
                                          "images/ahmad.jpg"))),
                              height: 52,
                              width: 52,
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text("Ahmad Jamal",
                                style: Resource.titTextStyle),
                          )
                        ],
                      ),
                      new Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Row(
                            children: <Widget>[
                              new Icon(Icons.star, size: 18.0),
                              new Icon(Icons.star, size: 18.0),
                              new Icon(Icons.star_half, size: 18.0),
                              new Icon(Icons.star_border, size: 18.0),
                              new Icon(Icons.star_border, size: 18.0),
                            ],
                          ))
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                    child: Text(
                        "Obada is the best but I gave him only 2 and a half stars cause he is AWESOME",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: Resource.desTextStyle),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
