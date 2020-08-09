import 'package:flutter/material.dart';
import 'package:served/Resource.dart';
import 'ShowProfile.dart';

class SendProposal extends StatefulWidget {
  @override
  _SendProposalState createState() => _SendProposalState();
}

class _SendProposalState extends State<SendProposal> {
  String _offerType;
  String _phonePrefix;
  String _country;


  @override
  void initState() {
    _offerType = "Points";
    _phonePrefix = "+963";
    _country = "Syria";
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Resource.primaryColor,
        title: Text("Served",
            style: new TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                letterSpacing: 3.5,
                fontFamily: 'Caveat')),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.send,color: Colors.white), onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: _width,
          child: Column(
            children: <Widget>[
              new Card(
                  margin: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                  elevation:  1.5,
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
                          )),
                      new Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 20.0, 0.0, 0.0),
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
                          ],
                        ),
                      ),
                    ],
                  )),
              new TextField(
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 18.0),
                    hintText: "Offer*",
                    contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
              ),
              new TextField(
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 18.0),
                    hintText: "Contact Phone*",
                    contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
              ),
              new TextField(
                maxLines: 5,
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 18.0),
                    hintText: "Description",
                    contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
              ),
              new Container(
                width: _width,
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "more majors would help do the service faster",
                  style: TextStyle(fontSize: 13.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}



