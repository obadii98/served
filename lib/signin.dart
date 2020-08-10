import 'package:flutter/material.dart';
import 'package:served/UserBoard.dart';
import 'GuestBoard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:served/Resource.dart';
import 'dart:async';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Duration get loginTime => Duration(milliseconds: 2250);
  final TextEditingController _econt = new TextEditingController();
  final TextEditingController _pcont = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Guest()));
        },
        backgroundColor: Resource.secondColor,
        child: Icon(Icons.arrow_forward,color: Resource.primaryColor),
      ),
      body: FlutterLogin(
        title: 'Served',
        theme: LoginTheme(
          primaryColor: Resource.primaryColor,
          accentColor: Resource.secondColor,
          titleStyle: TextStyle(
            fontFamily: "Caveat",
            letterSpacing: 15.0,
          ),
        ),
        logo: 'images/logo.png',
        onLogin: _authUser,
        onSignup: _signup,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => UserBoard(),
          ));
        },
      ),
    );
  }

  Future<String> _authUser(LoginData data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Name: ${data.name}, Password: ${data.password}');
    var url =
        'http://s.served98.com/api/login';
    var response = await http
        .post(url, body: {'email': data.name, 'password': data.password});
    Map<String, dynamic> user = convert.jsonDecode(response.body);
    String res = user['access_token'];
    return Future.delayed(loginTime).then((_) {
      if (response.statusCode != 200) {
        return "Email or Password dose not match";
      }
      prefs.setString('token', res); //saving the token
      print(prefs.getString('token'));
      prefs.setBool('signedin', true); //telling the device that the user had signed in
      _getUserDetails(); //getting the user details to save them
      return null;
    });
  }


  void _getUserDetails() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String _token = prefs.getString('token');
//    var url = 'http://s.served98.com/api/users/myprofail?token=$_token';
//    var response = await http.get(url);
//    Map<String, dynamic> userDetail = convert.jsonDecode(response.body);
//    prefs.setString('name', userDetail["name"]);
//    String _name = userDetail["name"];
//    double _points = userDetail["points"];
//    double _feedback = userDetail["feedback"];
//    double _secRate = userDetail["securityRate"];
//    String _country = userDetail["country"];
//    Resource.newnew = new User(_name,_points,_feedback,_secRate,_country);
//    print(Resource.newnew.name);
  }

  Future<String> _signup(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    String s = data.password;
    var url =
        'http://s.served98.com/api/register';
    var response = await http
        .post(url, body: {'email': data.name, 'password': data.password});
    return Future.delayed(loginTime).then((_) {
      if (response.statusCode != 200) {
        return response.statusCode.toString();
      } else {
        return 'Welcome new user';
      }
      return null;
    });
  }
}
