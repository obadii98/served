import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  static final _titleController = TextEditingController();
  String _name;
  int _priceGroup = 1;
  static int _serviceGroup = 2;

  @override
  void initState() {
    _name = "";
  }

  Future<void> _getDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
    });
  } //getting the name for the AddPost page

  static void savingInfo(){
    String _title = _titleController.text;
    String _typeOfService;
    if (_serviceGroup == 1)
      _typeOfService = "Money Exchange";
    else if (_serviceGroup == 2)
      _typeOfService = "Package Transfer";
    else
      _typeOfService = "Transport Sharing";
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        color: Resource.secondColor,
        height: _height,
        width: _width,
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage("images/profilepic.jpg"))),
                    height: 52,
                    width: 52,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new FutureBuilder(
                        future: _getDetails(),
                        builder: (buildContext,snapshot){
                          return Text(_name,
                              style: Resource.titTextStyle);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Container(
              width: _width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Radio(
                        value: 1,
                        groupValue: _priceGroup,
                        onChanged: (T){
                          print(T);
                          _priceGroup=T;
                        },
                      ),
                      new Text("Points", style: Resource.desTextStyle),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Radio(
                        value: 2,
                        groupValue: _priceGroup,
                        onChanged: (T){
                          print(T);
                          _priceGroup=T;
                        },
                      ),
                      new Text("Cash",style: Resource.desTextStyle,),
                    ],
                  )
                ],
              ),
            ),
            new TextField(
              keyboardType: TextInputType.numberWithOptions(),
              style: Resource.desTextStyle,
              decoration: InputDecoration(
                  hintStyle: Resource.desTextStyle,
                  hintText: "Add a Price*",
                  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
            ),
            new TextField(
              maxLines: 8,
              style: Resource.desTextStyle,
              decoration: InputDecoration(
                  hintStyle: Resource.desTextStyle,
                  hintText: "What do you need?*",
                  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
            ),
            new TextField(
              controller: _titleController,
              style: Resource.desTextStyle,
              decoration: InputDecoration(
                  hintStyle: Resource.desTextStyle,
                  hintText: "Add a title*",
                  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
            ),
            new Container(
              width: _width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Radio(
                            value: 1,
                            groupValue: _serviceGroup,
                            onChanged: (T){
                              print(T);
                              _serviceGroup=T;
                            },
                          ),
                          new Text("Exchange Money", style: Resource.desTextStyle),
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new Radio(
                            value: 2,
                            groupValue: _serviceGroup,
                            onChanged: (T){
                              print(T);
                              _serviceGroup=T;
                            },
                          ),
                          new Text("Package Transfer", style: Resource.desTextStyle),
                        ],
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(
                            value: 3,
                            groupValue: _serviceGroup,
                            onChanged: (T){
                              print(T);
                              _serviceGroup=T;
                            },
                          ),
                          new Text("Transport Sharing",style: Resource.desTextStyle)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            new TextField(
              style: Resource.hashTextStyle,
              decoration: InputDecoration(
                  hintStyle: Resource.hashTextStyle,
                  hintText: "#exchange_money , #travling , ...",
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
    );
  }
}
