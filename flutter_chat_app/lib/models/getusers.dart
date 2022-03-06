// To parse this JSON data, do
//
//     final getUser = getUserFromMap(jsonString);

import 'dart:convert';

GetUser getUserFromMap(String str) => GetUser.fromMap(json.decode(str));

String getUserToMap(GetUser data) => json.encode(data.toMap());

class GetUser {
    GetUser({
        required this.message,
        required this.users,
    });

    final String message;
    final List<User> users;

    factory GetUser.fromMap(Map<String, dynamic> json) => GetUser(
        message:  json["message"],
        users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "users": users == null ? null : List<dynamic>.from(users.map((x) => x.toMap())),
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String id;
    final String name;
    final String email;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        createdAt:  DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
    };
}
