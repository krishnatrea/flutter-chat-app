// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
    User({
        required this.message,
        required this.token,
        required this.userId,
        required this.name,
    });

    final String message;
    final String token;
    final String userId;
    final String name;

    factory User.fromMap(Map<String, dynamic> json) => User(
        message: json["message"],
        token: json["token"],
        userId: json["userId"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "token": token,
        "userId": userId,
        "name": name,
    };
}
