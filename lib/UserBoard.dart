import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:served/AddPost.dart';
import 'package:served/signin.dart';
import 'EditProfile.dart';
import 'UserSearch.dart';
import 'AddPost.dart';
import 'Notification.dart';
import 'Profile.dart';
import 'UserPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'Resource.dart';

class UserBoard extends StatefulWidget {
  @override
  _UserBoardState createState() => _UserBoardState();
}

class _UserBoardState extends State<UserBoard>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int _pState = 0; //for back-button
  Widget _appbar;
  Widget _drawer;
  Color _background;
  int _initpge;
  PageController _control;
  PageView _pageView;
  String _name;
  double _points;

  @override
  void initState() {
    _appbar = AppBar(
      backgroundColor: Resource.primaryColor,
      title: Text("Served",
          style: new TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              letterSpacing: 3.5,
              fontFamily: 'Caveat')),
    );
    _background = Resource.secondColor;
    _initpge = 0;
    _control = PageController(
      initialPage: _initpge,
      keepPage: true,
    );
    _pageView = PageView(
      controller: _control,
      physics: new NeverScrollableScrollPhysics(),
      onPageChanged: (int page) {
        setState(() {
          _currentIndex = page;
        });
      },
      children: <Widget>[
        mypage(),
        UserSearch(),
        AddPost(),
        Notifications(),
        Profile()
      ],
    );
    _name = "";
    _points = 0.0;
  }

  bool _onWillPop() {
    if (_control.page == 0) {
      return true;
    } else {
      _control.animateToPage(0,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      setState(() {
        _appbar = AppBar(
          backgroundColor: Resource.primaryColor,
          actions: <Widget>[FlatButton(onPressed: null, child: Text(""))],
          title: Text("Served",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  letterSpacing: 3.5,
                  fontFamily: 'Caveat')),
        );
        _background = Resource.secondColor;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () => Future.sync(_onWillPop), //for back-button
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: _appbar,
              endDrawer: _drawer,
              body: _pageView,
              backgroundColor: _background,
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Resource.darkSecColor,
                selectedItemColor: Resource.activePrimColor,
                iconSize: 27.0,
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    title: Text(""),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    title: Text(""),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle_outline),
                    title: Text(""),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    title: Text(""),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text(""),
                  ),
                ],
                onTap: (int index) {
                  switch (index) {
                    case 4:
                      _setProfile();
                      break;
                  }
                  setState(() {
                    _currentIndex = index;
                    _control.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    switch (index) {
                      case 0:
                        _appbar = AppBar(
                          backgroundColor: Resource.primaryColor,
                          actions: <Widget>[
                            FlatButton(onPressed: null, child: Text(""))
                          ],
                          title: Text("Served",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  letterSpacing: 3.5,
                                  fontFamily: 'Caveat')),
                        );
                        _background = Resource.secondColor;
                        break;
                      case 1:
                        _appbar = AppBar(
                          backgroundColor: Resource.primaryColor,
                          actions: <Widget>[
                            FlatButton(
                                onPressed: null,
                                child: Container(
                                  height: 1,
                                  width: 1,
                                ))
                          ],
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Image.asset("images/logo.png",
                                  width: 52, height: 52),
                              new Flexible(
                                  child: Container(
                                width: _width * (80 / 100),
                                height: _height * (6 / 100),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Search for Posts and Users...",
                                      hintStyle: TextStyle(fontSize: 16.0),
                                      prefixIcon: Icon(Icons.search),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(1, 1, 10, 1),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius:
                                              BorderRadius.circular(25.0))),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ))
                            ],
                          ),
                        );
                        _background = Resource.secondColor;
                        break;
                      case 2:
                        _appbar = AppBar(
                          backgroundColor: Resource.primaryColor,
                          title: Text("Served",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  letterSpacing: 3.5,
                                  fontFamily: 'Caveat')),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  _onLoading();
                                },
                                child: Icon(Icons.send, color: Colors.white))
                          ],
                        );
                        _drawer = Text("");
                        _background = Resource.secondColor;
                        break;
                      case 3:
                        _appbar = AppBar(
                          backgroundColor: Resource.primaryColor,
                          actions: <Widget>[
                            FlatButton(onPressed: null, child: Text(""))
                          ],
                          title: Text("Served",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  letterSpacing: 3.5,
                                  fontFamily: 'Caveat')),
                        );
                        _drawer = Text("");
                        _background = Resource.secondColor;
                        break;
                      case 4:
                        _appbar = AppBar(
                          backgroundColor: Resource.primaryColor,
                          title: Text("Served",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  letterSpacing: 3.5,
                                  fontFamily: 'Caveat')),
                        );
                        _drawer = Container(
                          height: _height,
                          width: _width * (75 / 100),
                          decoration: BoxDecoration(
                              color: Resource.secondColor,
                              border: Border(
                                  left: BorderSide(
                                      width: 2.0, color: Colors.grey))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  new FutureBuilder(
                                      future: _getDetail(),
                                      builder: (buildContext, snapshot) {
                                        return Padding(
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              new Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10.0, 10.0, 0.0, 0.0),
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
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    new Text(_name,
                                                        style: Resource
                                                            .titTextStyle),
                                                    new Text("$_points",
                                                        style: Resource
                                                            .pointTextStyle),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  new Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Divider(
                                      height: 2.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  new FlatButton(
                                    onPressed: () {},
                                    child: Container(
                                      width: _width * (75 / 100),
                                      height: _height * (8 / 100),
                                      child: Row(
                                        children: <Widget>[
                                          new Icon(Icons.security),
                                          new Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Text("Add a document",
                                                style:
                                                    TextStyle(fontSize: 16.0)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  new FlatButton(
                                    onPressed: () {},
                                    child: Container(
                                      width: _width * (75 / 100),
                                      height: _height * (8 / 100),
                                      child: Row(
                                        children: <Widget>[
                                          new Icon(Icons.label_important),
                                          new Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Text("Saved",
                                                style:
                                                    TextStyle(fontSize: 16.0)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  new FlatButton(
                                    onPressed: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setBool('signedin', false);
                                      prefs.clear();
                                      Navigator.of(context).pushReplacement(
                                          new MaterialPageRoute(
                                              builder: (context) => MyApp()));
                                    },
                                    child: Container(
                                      width: _width * (75 / 100),
                                      height: _height * (8 / 100),
                                      child: Row(
                                        children: <Widget>[
                                          new Icon(Icons.close),
                                          new Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Text("Sign out",
                                                style:
                                                    TextStyle(fontSize: 16.0)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Divider(
                                      height: 2.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  new FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditProfile()));
                                    },
                                    child: Container(
                                      width: _width * (75 / 100),
                                      height: _height * (8 / 100),
                                      child: Row(
                                        children: <Widget>[
                                          new Icon(Icons.settings),
                                          new Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Text("Edit Profile",
                                                style:
                                                    TextStyle(fontSize: 16.0)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                        _background = Resource.secondColor;
                        break;
                    }
                  });
                },
              ))),
    );
  }

  void _setProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _token = prefs.getString('token');
    var url = 'http://www.served98.com/public/api/users/myprofail?token=$_token';
    var response = await http.get(url);
    Map<String, dynamic> userDetail = convert.jsonDecode(response.body);
    prefs.setString('name', userDetail["name"]);
    prefs.setDouble('points', userDetail["points"]);
    prefs.setDouble('feedback', userDetail["feedback"]);
    prefs.setDouble('secRate', userDetail["securityRate"]);
    prefs.setString('country', userDetail["country"]);
  } //for setting the profile info in shared preferences when pressing the profile

  _getDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if(prefs.getString('name') == null)
        _name = "";
      else
        _name = prefs.getString('name');
      if (prefs.getDouble('points') == null)
        _points = 0.0;
      else
        _points = prefs.getDouble('points');
    });
  } //for the drawer in profile(photo,name,points)

  Future<String> _post() async {
    if(Resource.postKey.currentState.validate()) {
      String _cost = Resource.costController.text;
      String _description = Resource.desController.text;
      String _title = Resource.titleController.text;
      String _major;
      if (Resource.serviceGroup == 1)
        _major = "#Exchange_money";
      else if (Resource.serviceGroup == 2)
        _major = "#Package_Transfer";
      else
        _major = "#Transport_sharing";

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String _token = prefs.getString('token');
      var url = 'https://www.served98.com/public/api/posts?token=$_token';
      var urlForID = 'https://www.served98.com/public/api/users/myprofail?token=$_token';
      var idResponse = await http.get(urlForID);
      Map<String, dynamic> user = convert.jsonDecode(idResponse.body);
      String _id = user['id'].toString();
      print(_id);
      var response = await http.post(url,
          body: {
            'userId': _id,
            'title': _title,
            'description': _description,
            'cost': _cost,
            'major': _major
          });
      setState(() {
        Resource.costController.clear();
        Resource.desController.clear();
        Resource.titleController.clear();
      });
      print(response.statusCode);
    }
    else
      print("error");
  } //for adding a post

  void _onLoading() {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            width: _width * (10/100),
            height: _height * (10/100),
            child: Column(
              children: <Widget>[
                new CircularProgressIndicator()
              ],
            ),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context);
      _post();
    });
  } //loading for adding a post
}
