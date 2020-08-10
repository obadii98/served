import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:served/UserBoard.dart';
import 'dart:async';
import 'IntroPage.dart';
import 'package:served/Resource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin.dart';

void main() => runApp(MaterialApp(
      home: Loading(),
  debugShowCheckedModeBanner: false,
    ));

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _firstdownload = (prefs.getBool('firstdownload') ?? false);
    bool _signedin = (prefs.getBool('signedin') ?? false);
    if (_firstdownload == true && _signedin == false) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => MyApp()));
    } else if (_firstdownload == false && _signedin == false) {
      await prefs.setBool('firstdownload', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => Intro()));
    }
    else if (_signedin == true) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => UserBoard()));
    }
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, checkFirstSeen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset("images/logo.png", width: 74, height: 74),
                  new SpinKitThreeBounce(
                    color: Resource.primaryColor,
                    size: 50.0,
                  ),
                ],
              ),
              new Text(
                "Served",
                style: new TextStyle(
                    color: Resource.primaryColor,
                    fontSize: 32,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
