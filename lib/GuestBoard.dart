import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'signin.dart';
import 'Guestpage.dart';
import 'package:served/Resource.dart';

class Guest extends StatefulWidget {
  @override
  _GuestState createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  int _currentIndex = 0;
  Widget w;
  Widget _action;
  bool _isCard;

  final guestTabs = [
    ListView(
      children: <Widget>[mypage()],
    ), //cards
    Center() //search
  ];

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  initState() {
    w = Row(
      children: <Widget>[
        new Image.asset("images/logo.png",
            width: 45, height: 45),
        new Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text("Join us now",
              style: new TextStyle(fontSize: 24.0)),
        )
      ],
    );
    _action = Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 0.0),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
        child: Text(
          "HERE",
          style: TextStyle(
              color: Resource.primaryColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Resource.primaryColor),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: w,
          actions: <Widget>[_action],
          backgroundColor: Resource.primaryColor,
        ),
        body: guestTabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          fixedColor: Colors.white,
          backgroundColor: Resource.primaryColor,
          unselectedFontSize: 0.0,
          selectedFontSize: 0.0,
          iconSize: 30.0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              switch (index) {
                case 0:
                  {
                    w = Row(
                      children: <Widget>[
                        new Image.asset("images/logo.png",
                            width: 45, height: 45),
                        new Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Join us now",
                              style: new TextStyle(fontSize: 24.0)),
                        )
                      ],
                    );
                    _action = Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 0.0),
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        child: Text(
                          "HERE",
                          style: TextStyle(
                              color: Resource.primaryColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }
                  break;
                case 1:
                  {
                    w = Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Image.asset("images/logo.png", width: 52, height: 52),
                        new Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Search for Posts and Users...",
                                  prefixIcon: Icon(Icons.search),
                                  contentPadding:
                                  EdgeInsets.fromLTRB(15, 8, 5, 8),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(25.0))),
                              style:
                              TextStyle(color: Colors.black, fontSize: 20.0),
                            ))
                      ],
                    );
                    _action = Text("");
                  }
                  break;
              }
            });
          },
        ),
      ),
    );
  }
}
