import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Resource.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.send), onPressed: () {})
        ],
        backgroundColor: Resource.primaryColor,
        title: Text("Edit Profile",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
      ),
      body: Container(
        color: Resource.secondColor,
        width: _width,
        child: ListView(
          children: <Widget>[
            new Container(
              width: _width,
              height: _height * (25 / 100),
              child: Column(
                children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Center(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    new AssetImage("images/profilepic.jpg"))),
                        height: 72,
                        width: 72,
                      ))),
                  new Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      child: Text(
                        "Change Profile Photo",
                        style:
                            TextStyle(color: Resource.primaryColor, fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              width: _width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Profile Information",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: TextField(
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 14.0),
                          labelText: "Name",
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: TextField(
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 14.0),
                          labelText: "Bio",
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: TextField(
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 14.0),
                          labelText: "Gendre",
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                    child: Text(
                      "Account Information",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: TextField(
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 14.0),
                          labelText: "Email",
                          contentPadding:
                          EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: TextField(
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 14.0),
                          labelText: "Phone",
                          contentPadding:
                          EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 0.0)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
