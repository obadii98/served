import 'dart:convert';

import 'package:flutter/material.dart';

class Post{
  var id;
  var created_at;
  var updated_at;
  var title;
  var typeOfService;
  var major;
  var description;
  var fromLocation;
  var toLocation;
  var userId;
  var cost;
  var comp_id;
  var accepted;
  var generatedNumber;
  var done;

  Post({this.id, this.created_at, this.title, this.major, this.description, this.userId, this.cost});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      created_at: json['created_at'],
      title: json['title'],
      major: json['major'],
      description: json['description'],
      userId: json['userId'],
      cost: json['cost'],
    );
  }


}