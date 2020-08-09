import 'package:flutter/material.dart';
import 'package:served/UserBoard.dart';
import 'GuestBoard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:served/Resource.dart';
import 'dart:async';
import 'package:flutter_login/flutter_login.dart';

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
    print('Name: ${data.name}, Password: ${data.password}');
//    var url =
//        'https://sicsf.heliohost.org/public/api/login?api_token=aiW9amqG9ePkXvVkMLsiKMVBmlJvybceFi1g9spZyiBHBBKjjKdmPsmlizrZ';
//    var response = await http
//        .post(url, body: {'email': data.name, 'password': data.password});
//    return Future.delayed(loginTime).then((_) {
//      if (response.statusCode != 200) {
//        return 'Username or Password do not match';
//      }
//      return null;
//    });
  }

  Future<String> _signup(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    String s = data.password;
    var url =
        'https://sicsf.heliohost.org/public/api/register?api_token=aiW9amqG9ePkXvVkMLsiKMVBmlJvybceFi1g9spZyiBHBBKjjKdmPsmlizrZ';
    var response = await http
        .post(url, body: {'email': data.name, 'password': data.password});
    return Future.delayed(loginTime).then((_) {
      if (response.statusCode == 302) {
        return 'Username already exist';
      } else {
        return 'Welcome new user';
      }
      return null;
    });
  }
}
